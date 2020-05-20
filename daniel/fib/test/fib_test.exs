defmodule FibTest do
  use ExUnit.Case
  doctest Fib

  test "returns 0 for 0" do
    assert(Fib.of(0) == 0)
  end

  test "returns 1 for 1" do
    assert(Fib.of(1) == 1)
  end

  test "returns 1 for 2" do
    assert(Fib.of(2) == 1)
  end

  test "returns 2 for 3" do
    assert(Fib.of(3) == 2)
  end
end
