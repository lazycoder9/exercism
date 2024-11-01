defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @roman_numbers [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: numeral(number, @roman_numbers, "")

  def numeral(number, _, romans) when number == 0,
    do: romans

  def numeral(number, [[substractor, _] | tail], romans) when number < substractor,
    do: numeral(number, tail, romans)

  def numeral(number, [[substractor, roman] | _] = roman_numbers, romans),
    do: numeral(number - substractor, roman_numbers, romans <> roman)
end
