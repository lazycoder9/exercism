defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]
  @sound_vowels ["x", "y"]
  @exceptions ["qu"]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&to_pig/1)
    |> Enum.join(" ")
  end

  defp to_pig([first | _] = phrase) when first in @vowels,
    do: Enum.join(phrase, "") <> "ay"

  defp to_pig([first, second | _] = phrase)
       when first in @sound_vowels and second not in @vowels,
       do: Enum.join(phrase, "") <> "ay"

  defp to_pig([first, second | rest]) when (first <> second) in @exceptions,
    do: to_pig(Enum.reverse([second, first | Enum.reverse(rest)]))

  defp to_pig([first | rest]), do: to_pig(Enum.reverse([first | Enum.reverse(rest)]))
end
