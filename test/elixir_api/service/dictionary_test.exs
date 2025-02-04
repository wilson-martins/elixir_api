defmodule ElixirApi.DictionaryTest do
  use ExUnit.Case
  import Mox
  alias ElixirApi.Services.DictionaryImpl

  describe "signature_of" do
    test "with invalid inputs" do
      assert DictionaryImpl.signature_of([]) == ""
      assert DictionaryImpl.signature_of(nil) == ""
      assert DictionaryImpl.signature_of({}) == ""
      assert DictionaryImpl.signature_of(%{}) == ""
    end

    test "with empty string" do
      assert DictionaryImpl.signature_of("") == ""
    end

    test "with valid words" do
      assert DictionaryImpl.signature_of("snake") == "aekns"
      assert DictionaryImpl.signature_of("castle") == "acelst"
      assert DictionaryImpl.signature_of("show") == "hosw"
      assert DictionaryImpl.signature_of("letter") == "eelrtt"
    end
  end

  # describe "lookup_by_signature" do
  #   test "with valid words" do
  #     assert Dictionary.lookup_by_signature("drive")
  #            |> Enum.sort() ==
  #              ["drive"]
  #              |> Enum.sort()

  #     assert Dictionary.lookup_by_signature("stare")
  #            |> Enum.sort() ==
  #              ["rates", "stare", "tears"]
  #              |> Enum.sort()
  #   end

  #   test "with invalid word" do
  #     assert Dictionary.lookup_by_signature("tenet") == []
  #     assert Dictionary.lookup_by_signature("ddd") == []
  #     assert Dictionary.lookup_by_signature("") == []
  #     assert Dictionary.lookup_by_signature(nil) == []
  #     assert Dictionary.lookup_by_signature({}) == []
  #     assert Dictionary.lookup_by_signature(%{}) == []
  #     assert Dictionary.lookup_by_signature(0) == []
  #   end
  # end
end
