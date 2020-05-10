defmodule Users do
  dave = %{name: "Dave", state: "TX", likes: "programming"}

  IO.puts(
    case(dave) do
      %{state: some_state} = person ->
        "#{person.name} lives in #{some_state}"

      _ ->
        "no matches"
    end
  )
end
