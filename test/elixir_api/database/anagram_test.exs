defmodule ElixirApi.Repo.AnagramTest do
  use ElixirApi.DataCase

  alias ElixirApi.Repo

  describe "anagrams" do
    alias ElixirApi.Models.Anagram

    import(ElixirApi.AnagramsFixtures)

    @invalid_attrs %{id: nil, signature: nil, word: nil}

    test "list_anagrams/0 returns all anagrams" do
      anagram = anagram_fixture()
      assert Repo.Anagram.list_anagrams() == [anagram]
    end

    test "get_anagram!/1 returns the anagram with given id" do
      anagram = anagram_fixture()
      assert Repo.Anagram.get_anagram!(anagram.id) == anagram
    end

    test "create_anagram/1 with valid data creates a anagram" do
      valid_attrs = %{signature: "some signature", word: "some word"}

      assert {:ok, %Anagram{} = anagram} = Repo.Anagram.create_anagram(valid_attrs)
      assert anagram.signature == "some signature"
      assert anagram.word == "some word"
    end

    test "create_anagram/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Repo.Anagram.create_anagram(@invalid_attrs)
    end

    test "update_anagram/2 with valid data updates the anagram" do
      anagram = anagram_fixture()

      update_attrs = %{
        signature: "some updated signature",
        word: "some updated word"
      }

      assert {:ok, %Anagram{} = anagram} = Repo.Anagram.update_anagram(anagram, update_attrs)
      assert anagram.signature == "some updated signature"
      assert anagram.word == "some updated word"
    end

    test "update_anagram/2 with invalid data returns error changeset" do
      anagram = anagram_fixture()
      assert {:error, %Ecto.Changeset{}} = Repo.Anagram.update_anagram(anagram, @invalid_attrs)
      assert anagram == Repo.Anagram.get_anagram!(anagram.id)
    end

    test "delete_anagram/1 deletes the anagram" do
      anagram = anagram_fixture()
      assert {:ok, %Anagram{}} = Repo.Anagram.delete_anagram(anagram)
      assert_raise Ecto.NoResultsError, fn -> Repo.Anagram.get_anagram!(anagram.id) end
    end

    test "change_anagram/1 returns a anagram changeset" do
      anagram = anagram_fixture()
      assert %Ecto.Changeset{} = Repo.Anagram.change_anagram(anagram)
    end
  end
end
