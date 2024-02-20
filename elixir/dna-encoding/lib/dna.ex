defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      ?\s -> 0b0000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0b0000 -> ?\s
    end
  end

  def encode(dna), do: encode(dna, <<>>)
  defp encode([], acc), do: acc
  defp encode([h | t], acc), do: encode(t, <<acc::bitstring, encode_nucleotide(h)::4>>)

  def decode(dna), do: decode(dna, [])
  defp decode(<<>>, acc), do: acc
  defp decode(<<h::4, t::bitstring>>, acc), do: decode(t, acc ++ [decode_nucleotide(h)])
end
