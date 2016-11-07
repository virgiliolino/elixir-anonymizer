defmodule AnonymizerTest do
  use ExUnit.Case
  doctest Anonymizer

  test " after aggregation you should remove all triplets with __a count of 5 or less " do
    assert Anonymizer.filter([
      {"Berlin", 6},
      {"Zagreb", 1},
      {"Bucharest", 1},
      {"Bonn", 1},
      {"K-town", 2}
    ]) == [{"Berlin", 6}]  
  end

end
