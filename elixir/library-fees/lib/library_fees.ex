defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    Time.compare(NaiveDateTime.to_time(datetime), ~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    NaiveDateTime.add(checkout_datetime, days * 24 * 60 * 60) |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = NaiveDateTime.to_date(actual_return_datetime) |> Date.diff(planned_return_date)

    if diff > 0, do: diff, else: 0
  end

  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = datetime_from_string(checkout) |> return_date()
    actual_return_datetime = datetime_from_string(return)

    fee = rate * days_late(planned_return_date, actual_return_datetime)

    if monday?(actual_return_datetime), do: floor(fee * 0.5), else: fee
  end
end
