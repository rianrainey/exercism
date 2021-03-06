defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  defp my_reverse([], acc), do: acc
  defp my_reverse([head | tail], acc), do: my_reverse(tail, [head | acc])
  def reverse(l), do: my_reverse(l, [])

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head | tail], f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  defp my_reduce([], acc, _), do: acc
  defp my_reduce([head | tail], acc, f) do
    f.(head, my_reduce(tail, acc, f))
  end
  def reduce(l, acc, f), do: my_reduce(l, acc, f)

  @spec append(list, list) :: list
  defp my_append([], []), do: []
  defp my_append(a, []), do: a
  defp my_append([], b), do: b
  defp my_append(a, b), do: a++b
  def append(a, b), do: my_append(a,b)

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head | tail]), do: head ++ concat(tail)
end
