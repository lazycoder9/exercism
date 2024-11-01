defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      input_base < 2 ->
        {:error, "input base must be >= 2"}

      output_base < 2 ->
        {:error, "output base must be >= 2"}

      Enum.any?(digits, &(&1 < 0 || &1 >= input_base)) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        {:ok, digits |> get_base_10_number(input_base) |> convert_from_base_10(output_base)}
    end
  end

  defp convert_from_base_10(number, output_base) do
    convert_from_base_10(number, output_base, [])
  end

  defp convert_from_base_10(number, output_base, acc) when number < output_base,
    do: [number | acc]

  defp convert_from_base_10(number, output_base, acc) do
    convert_from_base_10(div(number, output_base), output_base, [rem(number, output_base) | acc])
  end

  defp get_base_10_number(digits, base),
    do: Enum.reduce(digits, 0, fn x, acc -> acc * base + x end)
end
