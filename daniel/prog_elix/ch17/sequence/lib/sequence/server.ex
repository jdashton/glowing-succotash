defmodule Sequence.Server do
  use GenServer

  #####
  # External API

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  @spec next_number :: any
  def next_number do
    GenServer.call __MODULE__, :next_number
  end

  @spec increment_number(any) :: :ok
  def increment_number(delta) do
    GenServer.cast __MODULE__, { :increment_number, delta }
  end

  #####
  # GenServer implementation

  @spec init(any) :: {:ok, any}
  def init(initial_number) do
    { :ok, initial_number }
  end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number + 1 }
  end

  def handle_call({ :set_number, new_number }, _from, _current_number) do
    { :reply, new_number, new_number }
  end

  def handle_call({ :factors, number }, _, _) do
    { :reply, { :factors_of, number, factors(number) }, [] }
  end

  @spec factors(any) :: [1 | 2, ...]
  defp factors(_) do
    [1, 2]
  end

  def handle_cast({ :increment_number, delta }, current_number) do
    { :noreply, current_number + delta }
  end

  @spec format_status(any, [...]) :: [{:data, [{any, any}, ...]}, ...]
  def format_status(_reason, [ _pdict, state ]) do
    [data: [{ 'State', "My current state is '#{inspect state}', and I'm happy" }]]
  end
end
