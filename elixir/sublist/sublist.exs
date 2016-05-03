defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    case {a, b} do
      {[], []}                         -> :equal
      { a, a }                         -> :equal
      {[], _ }                         -> :sublist
      {_, [] }                         -> :superlist
      { [ a | [] ], [ b | [] ] }       -> :unequal
      { [ a | atail ], [ a | btail ] } -> compare(atail, btail)
      { a, b } when length(a) > length(b) ->
        case compare(tl(a), b) do
          :equal     -> :superlist
          :superlist -> :superlist
        end
      { a, b } when length(b) > length(a) ->
        case compare(a, tl(b)) do
          :equal     -> :sublist
          :sublist when hd(a) == hd(tl(b)) -> :sublist
          :sublist                         -> :unequal
          :unequal   -> :unequal
        end
      { a, b } when length(b) == length(a) -> :unequal
    end
  end

  # TODO: Define sublist and superlist methods
end
