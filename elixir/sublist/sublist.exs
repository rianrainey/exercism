defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _),  do: :sublist
  def compare(_, []),  do: :superlist
  def compare( [ a | a_tail ], [ b | b_tail ]) do
    cond do
      a != b -> :unequal
      a == b -> :equal
    end
  end
end
