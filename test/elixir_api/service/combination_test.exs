defmodule ElixirApi.CombinationTest do
  use ExUnit.Case
  alias ElixirApi.Services.Combination

  describe "subsets" do
    test "with empty array" do
      assert Combination.subsets([]) == [[]]
    end

    test "with 1-element array" do
      assert Combination.subsets([1]) == [[], [1]]
    end

    test "with valid subsets" do
      assert Combination.subsets([1, 2])
             |> Enum.sort() ==
               [[], [1], [2], [1, 2]]
               |> Enum.sort()

      assert Combination.subsets(["a", "b", "c"])
             |> Enum.sort() ==
               [[], ["a"], ["a", "b"], ["a", "b", "c"], ["a", "c"], ["b"], ["b", "c"], ["c"]]
               |> Enum.sort()
    end
  end
end
