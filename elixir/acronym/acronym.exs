defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> strip_non_characters
    |> separate_on_uppercase
    |> String.split(" ", trim: true)
    |> first_letter_of_each_word
    |> upcase_each
    |> Enum.join
  end

  defp separate_on_uppercase(input) do
    String.replace(input, ~r/([A-Z])/, " \\1")
  end

  defp upcase_each(list) do
    Enum.map(list, fn(c) -> String.upcase(c) end)
  end

  defp strip_non_characters(input) do
    String.replace(input, ~r/\W/, " ")
  end

  defp first_letter_of_each_word(words) do
    Enum.map(words, fn(word) -> String.at(word, 0) end)
  end
end
