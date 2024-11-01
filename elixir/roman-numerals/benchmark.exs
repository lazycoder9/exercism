Benchee.run(%{
  "numeral" => fn n -> RomanNumerals.numeral(n) end,
  "iter1" => fn n -> RomanNumerals.Iter1.numeral(n) end,
  "iter2" => fn n -> RomanNumerals.Iter2.numeral(n) end,
}, inputs: %{
    "3991" => 3991,
    "991" => 991,
  },
  reduction_time: 2)
