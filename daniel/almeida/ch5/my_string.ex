defmodule MyString do
  def capitalize_words(title) do
    title
    |> String.split
    |> capitalize_all
    |> join_with_whitespace
  end

  defp capitalize_all(words) do
    Enum.map(words, &String.capitalize/1)
  end

  defp join_with_whitespace(words) do
    Enum.join(words, " ")
  end
end
