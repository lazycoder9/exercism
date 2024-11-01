Benchee.run(%{
  "nth" => fn n -> Prime.nth(n) end,
}, inputs: %{
    "100" => 100,
    "100000" => 100000,
  },
  reduction_time: 2)
