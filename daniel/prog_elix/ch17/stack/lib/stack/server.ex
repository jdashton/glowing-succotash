defmodule Stack.Server do
  use GenServer

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: :frog)
  end

  @spec pop :: any
  def pop do
    GenServer.call(:frog, :pop)
  end

  @spec push(any) :: :ok
  def push(new_val) do
    GenServer.cast(:frog, { :push, new_val })
  end

  @spec init(any) :: {:ok, any}
  def init(initial_stack) do
    { :ok, initial_stack }
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
    IO.puts "Terminating because #{inspect reason} with state #{inspect state}."
  end
end
