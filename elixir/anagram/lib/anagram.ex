defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates |> Enum.filter(&anagram?(base, &1))
  end

  defp anagram?(base, candidate) do
    get_sorted_graphemes(base) == get_sorted_graphemes(candidate) and
      String.downcase(base) != String.downcase(candidate)
  end

  defp get_sorted_graphemes(word) do
    word |> String.downcase() |> String.graphemes() |> Enum.sort()
  end
end
