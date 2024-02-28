defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory |> Enum.sort_by(fn i -> i[:price] end)
  end

  def with_missing_price(inventory) do
    inventory |> Enum.reject(fn i -> i[:price] end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn item ->
      new_name = String.replace(item[:name], old_word, new_word)
      %{item | name: new_name}
    end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn l ->
      Map.new(l, fn {key, value} -> {key, value + count} end)
    end)
  end

  def total_quantity(item) do
    item[:quantity_by_size] |> Enum.reduce(0, fn {_, value}, acc -> acc + value end)
  end
end
