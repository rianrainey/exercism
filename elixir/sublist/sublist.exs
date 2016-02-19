defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  #def compare(a, b) do
    #case {a, b} do
      #{[], []} -> :equal
      #{[], _} -> :sublist
      #{_, []} -> :superlist
      #{[x|[]], [x|[]]} -> :equal
      #{[_|[]], [_|[]]} -> :unequal
      #{[x|xs], [x|ys]} -> compare(xs, ys)
      #{x, [_|ys]} ->
        #case compare(x, ys) do
          #:equal     -> :sublist
          #:sublist   -> :sublist
          #:superlist -> :superlist
          #:unequal   -> :unequal
        #end
    #end
  #end
  def compare(a, b) do
    case {a, b} do
      {[], []}                         -> :equal
      {[], _}                          -> :sublist
      {_, []} when length(a) > length(b) -> :superlist
      { [ a | [] ], [ a | [] ] }       -> :equal
      { [ _ | [] ],  [ _ | [] ] }      -> :unequal
      { [ a | atail ], [ a | btail ] } -> compare(atail, btail)
      { a, [ _ | btail ] } ->
        case compare(a, btail) do
          :equal     -> :sublist
          :sublist   -> :sublist
          :superlist -> :superlist
          :unequal   -> :unequal
        end
    end
  end
  #def compare([], []), do: :equal
  #def compare([], b) when is_list(b),  do: :sublist
  #def compare(a, []) when is_list(a),  do: :superlist
  ##def compare(a, b) when a === b, do: :equal
  #def compare( [ a | a_tail ], [ b | b_tail ]) do
    #cond do
      ##a === b -> :equal
      #a !== b -> _sub_compare(a_tail, b_tail)
    #end
  #end
  #defp _sub_compare(a, b) do
    #cond do
      #a !== b -> :unequal
    #end
  #end
  #defp _sublist?(a, b), do: sublist
end
