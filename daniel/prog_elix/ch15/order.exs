defmodule SpawnInOrder do
  def greet do
    receive do
      {sender, msg} -> send sender, { :ok, msg }
    end
  end
end

pid1 = spawn(SpawnInOrder, :greet, [])
pid2 = spawn(SpawnInOrder, :greet, [])
send pid1, {self(), :fred}
send pid2, {self(), :betty}

receive do
  {:ok, message} -> IO.inspect message
end

receive do
  {:ok, message} -> IO.inspect message
end


