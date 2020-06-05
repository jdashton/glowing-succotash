defmodule Stack.Server do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: :frog)
  end

  def pop do
    GenServer.call(:frog, :pop)
  end

  def push(new_val) do
    GenServer.cast(:frog, { :push, new_val })
  end

  def init(_) do
    { :ok, Stack.Stash.get() }
  end

  def handle_call(:pop, _from, [ first | rest ]) do
    { :reply, first, rest }
  end

  def handle_cast({ :push, new_val }, current_stack) do
    { :noreply, [ new_val | current_stack ] }
  end

  def handle_cast(:stop, _from, _) do
    { :stop }
  end

  def terminate(reason, state) do
    Stack.Stash.update(state)
    IO.puts "Terminating because #{inspect reason} with state #{inspect state}."
  end
end
