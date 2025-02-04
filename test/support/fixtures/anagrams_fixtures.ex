defmodule ElixirApi.AnagramsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirApi.Anagrams` context.
  """

  @doc """
  Generate a anagram.
  """
  def anagram_fixture(attrs \\ %{}) do
    {:ok, anagram} =
      attrs
      |> Enum.into(%{
        signature: "some signature",
        word: "some word"
      })
      |> ElixirApi.Repo.Anagram.create_anagram()

    anagram
  end
end
