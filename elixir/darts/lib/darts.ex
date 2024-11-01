defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    d = :math.sqrt(x ** 2 + y ** 2)

    cond do
      d <= 1 -> 10
      d <= 5 -> 5
      d <= 10 -> 1
      true -> 0
    end
  end
end
