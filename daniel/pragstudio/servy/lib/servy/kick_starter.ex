defmodule Servy.KickStarter do
  @name __MODULE__

  use GenServer

  def start_link(_arg) do
    IO.puts "Starting the kickstarter..."
    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def get_server do
    GenServer.call(@name, :get_pid)
  end

  def init(:ok) do
    Process.flag(:trap_exit, true)
    server_pid = start_server()
    {:ok, server_pid}
  end

  def handle_call(:get_pid, _from, state) do
    {:reply, state, state}
  end

  def handle_info({:EXIT, _pid, reason}, _state) do
    IO.puts "HttpServer exited (#{inspect reason})"
    server_pid = start_server()
    {:noreply, server_pid}
  end

  defp start_server do
    IO.puts "Starting the HTTP server..."
    port = Application.get_env(:servy, :port)
    server_pid = spawn_link(Servy.HttpServer, :start, [port])
    Process.register(server_pid, :http_server)
    server_pid
  end
end
