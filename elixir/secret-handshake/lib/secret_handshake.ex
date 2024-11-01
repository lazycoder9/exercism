defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    actions =
      code
      |> Integer.digits(2)
      |> Enum.reverse()
      |> Enum.zip(["wink", "double blink", "close your eyes", "jump", "reverse"])
      |> Enum.filter(fn {bit, action} -> bit == 1 && action end)
      |> Enum.map(fn {_, action} -> action end)
      |> Enum.reverse()

    cond do
      actions == [] ->
        []

      code >= 16 ->
        [_ | tail] = actions
        tail

      true ->
        Enum.reverse(actions)
    end
  end
end
