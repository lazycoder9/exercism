# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start_link(fn -> [id: 1, list: []] end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state[:list] end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn [id: id, list: list] ->
      plot = %Plot{plot_id: id, registered_to: register_to}
      {plot, [id: id + 1, list: [plot | list]]}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn [id: id, list: list] ->
      {:ok, [id: id, list: Enum.reject(list, fn plot -> plot.plot_id == plot_id end)]}
    end)
  end

  def get_registration(pid, plot_id) do
    list_registrations(pid)
    |> Enum.find({:not_found, "plot is unregistered"}, fn plot -> plot.plot_id == plot_id end)
  end
end
