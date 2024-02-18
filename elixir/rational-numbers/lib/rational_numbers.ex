defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({num1, denom1}, {num2, denom2}), do: {num1 * denom2 + num2 * denom1, denom1 * denom2} |> reduce

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({num1, denom1}, {num2, denom2}), do: {num1 * denom2 - num2 * denom1, denom1 * denom2} |> reduce

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num1, denom1}, {num2, denom2}), do: {num1 * num2, denom1 * denom2} |> reduce

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num1, denom1}, {num2, denom2}), do: {num1 * denom2, num2 * denom1} |> reduce

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, denom}), do: {Kernel.abs(num), Kernel.abs(denom)} |> reduce

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, denom}, n) do
    rat =
      cond do
        n < 0 -> {Integer.pow(denom, n * -1), Integer.pow(num, n * -1)}
        true -> {Integer.pow(num, n), Integer.pow(denom, n)}
      end

    rat |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, denom}), do: x ** (num/denom)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, denom}) when denom < 0, do: reduce({-num, -denom})
  def reduce({num, denom}) do
    gcd = Integer.gcd(Kernel.abs(num), Kernel.abs(denom))

    {num / gcd, denom / gcd}
  end
end
