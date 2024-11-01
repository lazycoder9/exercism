defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn c -> rotate_char(c, shift) end)
    |> to_string()
  end

  defp rotate_char(c, shift) when c in ?a..?z, do: rem(c - ?a + shift, 26) + ?a

  defp rotate_char(c, shift) when c in ?A..?Z, do: rem(c - ?A + shift, 26) + ?A

  defp rotate_char(c, _shift), do: c
end
