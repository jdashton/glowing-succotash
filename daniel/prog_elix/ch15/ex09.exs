defmodule FibSolver do
  def fib(scheduler) do
    send(scheduler, {:ready, self()})

    receive do
      {:fib, n, client} ->
        send(client, {:answer, n, fib_calc(n), self()})
        fib(scheduler)

      {:shutdown} ->
        exit(:normal)
    end
  end

  # very inefficient, deliberately
  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n - 1) + fib_calc(n - 2)
end

# TODO
# Exercise: WorkingWithMultipleProcesses-9
# Take this scheduler code and update it to let you run a function that finds
# the number of times the word “cat” appears in each file in a given directory.
# Run one server process per file. The function File.ls! returns the names of
# files in a directory, and File.read! reads the contents of a file as a binary.
# Can you write it as a more generalized scheduler?
# Run your code on a directory with a reasonable number of files (maybe
# around 100) so you can experiment with the effects of concurrency.

defmodule Scheduler do
  def run(num_processes, module, func, to_calculate) do
    1..num_processes
    |> Enum.map(fn _ -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when queue != [] ->
        [next | tail] = queue
        send(pid, {:fib, next, self()})
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send(pid, {:shutdown})

        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      {:answer, number, result, _pid} ->
        schedule_processes(processes, queue, [{number, result} | results])
    end
  end
end

to_process = List.duplicate(37, 20)

1..30
# |> Enum.reverse()
|> Enum.each(fn num_processes ->
  {time, result} =
    :timer.tc(
      Scheduler,
      :run,
      [num_processes, FibSolver, :fib, to_process]
    )

  if num_processes == 1 do
    IO.puts(inspect(result))
    IO.puts("\n#\ttime (s)")
  end

  :io.format("~2B\t~.2f~n", [num_processes, time / 1_000_000.0])
end)
