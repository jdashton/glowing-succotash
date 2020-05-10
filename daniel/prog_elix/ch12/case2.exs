dave = %{name: "Dave", age: 27}

IO.puts(
  case dave do
    person = %{age: age} when is_number(age) and age >= 21 ->
      "You are clared to enter the Foo Bar, #{person.name}"

    _ ->
      "Sorry, no admission"
  end
)
