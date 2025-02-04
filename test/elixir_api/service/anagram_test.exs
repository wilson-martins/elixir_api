defmodule ElixirApi.AnagramTest do
  use ExUnit.Case
  import Mox
  alias ElixirApi.Services.DictionaryImpl
  alias ElixirApi.Services.Anagram

  setup :verify_on_exit!

  describe "anagrams_in" do
    test "valid words" do
      ElixirApi.Services.DictionaryBehaviourMock
      |> Mox.stub_with(ElixirApi.Services.DictionaryImpl)

      ElixirApi.Services.DictionaryBehaviourMock
      |> expect(:lookup_by_signature, 5, fn
        "acst" -> ["cast", "acts", "cats"]
        "cst" -> []
        "ast" -> []
        "act" -> ["cat", "act"]
        "acs" -> []
      end)

      assert Anagram.anagrams_in("cast") == %{
               3 => ["act", "cat"],
               4 => ["acts", "cast", "cats"]
             }
    end
  end
end
