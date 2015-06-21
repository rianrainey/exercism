defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    #Enum.reduce(l, 0, fn(x, acc) -> x + acc end)
    count_items(l)
  end

  defp count_items([]) do
    0
  end

  defp count_items([head|tail]) do
    1 + count_items(tail)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse_head_and_tail(l, [])
  end

  def reverse_head_and_tail([], acc) do
    acc
  end

  def reverse_head_and_tail([head | tail], acc) do
    reverse_head_and_tail(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do

  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
