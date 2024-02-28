defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_binary(path) do
    parts = String.split(path, ".")

    extract_from_path(data, parts)
  end

  def extract_from_path(nil, _), do: nil
  def extract_from_path(data, []), do: data

  def extract_from_path(data, [head | tail]) do
    extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) when is_binary(path) do
    parts = String.split(path, ".")
    get_in(data, parts)
  end
end
