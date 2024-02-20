defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        loop(state)

      {:take_a_number, pid} ->
        new_state = state + 1
        send(pid, new_state)
        loop(new_state)

      :stop ->
        :stop

      _ ->
        loop(state)
    end
  end
end
