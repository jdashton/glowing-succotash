defmodule Servy.HttpClient do
  def send_request(request) do
    some_host_in_net = 'localhost' # to make it runnable on one machine
    {:ok, sock} = :gen_tcp.connect(some_host_in_net, 4000, [:binary, packet: :raw, active: false])
    :ok = :gen_tcp.send(sock, request)
    {:ok, response} = :gen_tcp.recv(sock, 0)
    :ok = :gen_tcp.close(sock)
    response
  end

  def some_data do
    """
    GET /bears HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """
  end
end

# response = Servy.HttpClient.send_request(Servy.HttpClient.some_data())
# IO.inspect response
