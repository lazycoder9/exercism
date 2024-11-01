defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map(fn
      [char] -> char
      [char | rest] -> "#{length(rest) + 1}#{char}"
    end)
    |> Enum.join()
  end

  @spec decode(String.t()) :: String.t()
  def decode(string), do: decode(String.graphemes(string), 0, "")

  defp decode([], _multiplier, acc), do: acc

  defp decode([h | t], multiplier, acc) do
    case Integer.parse(h) do
      {num, _} -> decode(t, multiplier * 10 + num, acc)
      _ -> decode(t, 0, acc <> String.duplicate(h, max(1, multiplier)))
    end
  end
end
