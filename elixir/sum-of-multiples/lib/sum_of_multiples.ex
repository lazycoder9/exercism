defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.reject(fn factor -> factor == 0 end)
    |> Enum.map(fn factor -> Enum.filter(1..(limit - 1), fn n -> rem(n, factor) == 0 end) end)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sum()
  end
end
