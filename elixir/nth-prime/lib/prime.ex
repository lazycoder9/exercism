defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(1), do: 2
  def nth(count) when count > 0, do: find_nth(count - 2, 3)

  defp find_nth(0, current_number), do: current_number

  defp find_nth(n, current_number),
    do:
      with(
        next = current_number + 2,
        do: find_nth(if(prime?(next, 3), do: n - 1, else: n), next)
      )

  defp prime?(number, divisor) when divisor * divisor > number, do: true
  defp prime?(number, divisor) when rem(number, divisor) == 0, do: false
  defp prime?(number, divisor), do: prime?(number, divisor + 2)
end
