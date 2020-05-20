defmodule Exercise04 do
  import :timer, only: [sleep: 1]

  def reply(sender) do
    send(sender, {:ok, :did_that})
    raise("raising as requested")
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_monitor(Exercise04, :reply, [self()])
    sleep(500)

    receive_stuff()
  end

  defp receive_stuff do
    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED #{inspect(msg)}")
        receive_stuff()
    after
      1000 -> IO.puts("Nothing happened as far as I am concerned")
    end
  end
end

Exercise04.run()
