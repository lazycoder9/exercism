defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "")
    |> String.to_charlist()
    |> Enum.map(&encode_char/1)
    |> Enum.chunk_every(5)
    |> Enum.map(&to_string/1)
    |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.downcase()
    |> String.replace(~r/\s/, "")
    |> String.to_charlist()
    |> Enum.map(&encode_char/1)
    |> to_string()
  end

  defp encode_char(char) when char in ?a..?z, do: 96 + abs(char - 123)

  defp encode_char(char), do: char
end
