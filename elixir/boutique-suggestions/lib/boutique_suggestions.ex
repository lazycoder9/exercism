defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = Keyword.get(options, :maximum_price, 100.0)

    for tops <- tops,
        bottoms <- bottoms,
        tops[:base_color] != bottoms[:base_color],
        tops[:price] + bottoms[:price] <= max_price do
      {tops, bottoms}
    end
  end
end
