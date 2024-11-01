defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0, do: calc(input, 0)
  defp calc(1, acc), do: acc
  defp calc(num, acc) when rem(num, 2) == 0, do: calc(div(num, 2), acc + 1)
  defp calc(num, acc) when rem(num, 2) == 1, do: calc(3 * num + 1, acc + 1)
end
