defmodule Times do
  defmacro times_n(x) do
    quote do
      def unquote(:"times_#{ x }")(y) do
        unquote(x) * y
      end
    end
  end
end

defmodule Test do
  require Times

  Times.times_n(3)
  Times.times_n(4)

  [5, 6]
  |> Enum.each(fn x ->
    def unquote(:"times_#{ x }")(y) do
      unquote(x) * y
    end
  end)
end

IO.puts Test.times_3(4)
IO.puts Test.times_4(5)
IO.puts Test.times_5(6)
IO.puts Test.times_6(7)
