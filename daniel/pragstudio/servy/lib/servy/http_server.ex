defmodule Servy.HttpServer do
  def server do
    {:ok, lsock} = :gen_tcp.listen(5678, [:binary, packet: 0, active: false])
    {:ok, sock} = :gen_tcp.accept(lsock)
    {:ok, bin} = :gen_tcp.recv(sock, 0)
    # send response
    :ok = :gen_tcp.close(sock)
    :ok = :gen_tcp.close(lsock)
    bin
  end

  def start(port) when is_integer(port) and port > 1023 do
    {:ok, listen_socket} =
      :gen_tcp.listen(port, [:binary, packet: :raw, active: false, reuseaddr: true])

    IO.puts "\n🎧  Listening for connection requests on port #{port}...\n"

    accept_loop(listen_socket)
  end

  def accept_loop(listen_socket) do
    IO.puts "⌛️  Waiting to accept a client connection...\n"

    {:ok, client_socket} = :gen_tcp.accept(listen_socket)

    IO.puts "⚡️  Connection accepted!\n"

    pid = spawn( fn -> serve(client_socket) end)

    :ok = :gen_tcp.controlling_process(client_socket, pid)

    accept_loop(listen_socket)
  end

  def serve(client_socket) do
    IO.puts "#{ inspect self() }: Working on it!"
    client_socket
    |> read_request
    |> Servy.Handler.handle
    |> write_response(client_socket)
  end

  def read_request(client_socket) do
    {:ok, request} = :gen_tcp.recv(client_socket, 0)

    IO.puts "➡️  Received request:\n"
    IO.puts request

    request <> "\r\n\r\n"
  end

  def generate_response(_request) do
    """
    HTTP/1.1 200 OK\r
    Content-Type: text/plain\r
    Content-Length: 6\r
    \r
    Hello!
    """
  end

  def write_response(response, client_socket) do
    :ok = :gen_tcp.send(client_socket, response)

    IO.puts "⬅️  Sent response:\n"
    IO.puts response

    :gen_tcp.close(client_socket)
  end
end
