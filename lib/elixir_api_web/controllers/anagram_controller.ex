defmodule ElixirApiWeb.AnagramController do
  use ElixirApiWeb, :controller

  alias ElixirApi.Services
  alias ElixirApi.Repo

  action_fallback ElixirApiWeb.FallbackController

  def getWords(conn, params) do
    conn
    |> put_status(200)
    |> json(%{words: Services.Anagram.anagrams_in(params["word"])})
  end

  def loadFile(conn, __params) do
    anagrams =
      File.read!("./assets/words.txt")
      |> String.downcase()
      |> String.split("\n")
      |> Enum.map(&String.replace(&1, "\r", ""))
      |> Enum.map(&String.trim/1)
      |> Enum.map(&%{:word => &1, :signature => Services.Dictionary.signature_of(&1)})

    with {:ok, count} <- Repo.Anagram.create_anagrams(anagrams) do
      conn
      |> put_status(:created)
      |> json(%{message: "File successfully uploaded.", count: count})
    end
  end
end
