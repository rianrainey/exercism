require IEx

defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    regex = ~r/(_|[^\w\p{Pd}])+/u

    sentence
    |> String.downcase
    |> String.split(regex, trim: true)
    |> Enum.reduce(Map.new, &make_dict_counter/2)
  end

  defp make_dict_counter(word, dict) do
    Dict.update(dict, word, 1, &(1 + &1))
  end
end
