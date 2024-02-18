defmodule Username do
  def sanitize([]), do: []

  def sanitize([first_letter | rest_letter]) do
    cleaned =
      case first_letter do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        first_letter when first_letter >= ?a and first_letter <= ?z -> [first_letter]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    cleaned ++ sanitize(rest_letter)
  end
end
