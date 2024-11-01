defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when length(a) == length(b) and a === b, do: :equal

  def compare(a, b) do
    reverse = length(a) < length(b)
    result = if reverse, do: do_compare(b, a), else: do_compare(a, b)

    cond do
      result == :sublist and reverse -> :superlist
      result == :superlist and reverse -> :sublist
      true -> result
    end
  end

  defp do_compare([_h | t] = a, b) do
    cond do
      b === Enum.take(a, length(b)) -> :superlist
      length(a) == length(b) && a != b -> :unequal
      true -> do_compare(t, b)
    end
  end
end
