defmodule MyList do
  def reduce([], value, _),                 do: value
  def reduce([ head | tail ], value, func), do: reduce(tail, func.(head, value), func)

  def map([], _func),             do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def mapsum(list, func) do
    list
    |> map(func)
    |> reduce(0, &+/2)
  end

  def max([ head | _ ] = list) do
    list
    |> reduce(head, fn 
      x, y when x > y -> x
      _, y            -> y
    end)
  end

  def caesar(list, offset) do
    map list, fn
      c when c + offset <= ?z -> c + offset
      c                       -> c - offset
    end
  end
end
