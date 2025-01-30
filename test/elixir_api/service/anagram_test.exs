defmodule ElixirApi.AnagramTest do
  use ExUnit.Case
  alias ElixirApi.Services.Anagram

  describe "anagrams_in" do
    test "valid words" do
      assert Anagram.anagrams_in("castle") == %{
               3 => ["act", "sea", "set"],
               4 => [
                 "case",
                 "cast",
                 "east",
                 "lace",
                 "last",
                 "late",
                 "sale",
                 "salt",
                 "seal",
                 "seat",
                 "sect"
               ],
               5 => ["least", "scale", "slate", "stale", "steal"],
               6 => ["castle"]
             }

      assert Anagram.anagrams_in("tests") == %{3 => ["set"], 4 => ["test"], 5 => ["tests"]}
    end
  end
end
