defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _),  do: :sublist
  def compare(_, []),  do: :superlist
  def compare( [ a | [] ], [ b | [] ]) do
    cond do
      a === b -> :equal
      a !== b -> :unequal
    end
  end
  def compare( [ _ | a_tail ], [ _ | b_tail ]) do
    compare(a_tail, b_tail)
  end
end
