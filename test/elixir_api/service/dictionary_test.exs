defmodule ElixirApi.DictionaryTest do
  use ExUnit.Case
  alias ElixirApi.Services.Dictionary

  describe "signature_of" do
    test "with invalip inputs" do
      assert Dictionary.signature_of([]) == ""
      assert Dictionary.signature_of(nil) == ""
      assert Dictionary.signature_of({}) == ""
      assert Dictionary.signature_of(%{}) == ""
    end

    test "with empty string" do
      assert Dictionary.signature_of("") == ""
    end

    test "with valid words" do
      assert Dictionary.signature_of("snake") == "aekns"
      assert Dictionary.signature_of("castle") == "acelst"
      assert Dictionary.signature_of("show") == "hosw"
      assert Dictionary.signature_of("letter") == "eelrtt"
    end
  end

  describe "lookup_by_signature" do
    test "with valid words" do
      assert Dictionary.lookup_by_signature("drive")
             |> Enum.sort() ==
               ["deriv", "diver", "drive", "rived", "verdi"]
               |> Enum.sort()

      assert Dictionary.lookup_by_signature("walking")
             |> Enum.sort() ==
               ["walking"]
               |> Enum.sort()

      assert Dictionary.lookup_by_signature("stare")
             |> Enum.sort() ==
               [
                 "arest",
                 "aster",
                 "astre",
                 "rates",
                 "reast",
                 "resat",
                 "serta",
                 "stare",
                 "strae",
                 "tares",
                 "tarse",
                 "tears",
                 "teras",
                 "treas"
               ]
               |> Enum.sort()

      assert Dictionary.lookup_by_signature("tenet")
             |> Enum.sort() ==
               ["entte", "tenet"]
               |> Enum.sort()
    end

    test "with invalid word" do
      assert Dictionary.lookup_by_signature("ddd") == []
      assert Dictionary.lookup_by_signature("") == []
      assert Dictionary.lookup_by_signature(nil) == []
      assert Dictionary.lookup_by_signature({}) == []
      assert Dictionary.lookup_by_signature(%{}) == []
      assert Dictionary.lookup_by_signature(0) == []
    end
  end
end
