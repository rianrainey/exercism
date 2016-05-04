defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> strip_non_characters
    |> String.split(" ")
    |> first_letter_of_each_word
    |> remove_empty
    |> upcase_each
    |> Enum.join
    |> String.upcase
  end

  defp remove_empty(list) do
    Enum.filter(list, fn(x) -> x != nil end)
  end

  defp upcase_each(list) do
    IO.puts "list: #{list}"
    Enum.map(list, fn(c) -> String.upcase(c) end)
  end

  defp strip_non_characters(input) do
    result = String.replace(input, ~r/\W/, " ")
    #IO.puts "strip non chars: #{result}"
    result
  end

  defp first_letter_of_each_word(words) do
    Enum.map(words, fn(word) -> String.at(word, 0) end)
  end
end
