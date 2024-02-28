defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}), do: "Battery empty"

  def display_battery(%RemoteControlCar{battery_percentage: p}) do
    "Battery at #{p}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car

  def drive(%RemoteControlCar{battery_percentage: b, distance_driven_in_meters: p} = remote_car) do
    %{remote_car | distance_driven_in_meters: p + 20, battery_percentage: b - 1}
  end
end
