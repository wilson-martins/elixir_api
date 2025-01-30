defmodule ElixirApiWeb.AnagramsController do
  use ElixirApiWeb, :controller
  import ElixirApi.Services.Anagram

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{words: "Welcome to the Elixir API #{Mix.env()} environment"})
  end

  def getWords(conn, params) do
    conn
    |> put_status(200)
    |> json(%{words: anagrams_in(params["word"])})
  end
end
