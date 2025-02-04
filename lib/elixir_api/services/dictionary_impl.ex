defmodule ElixirApi.Services.DictionaryImpl do
  @behaviour ElixirApi.Services.DictionaryBehaviour

  alias ElixirApi.Repo

  @spec signature_of(String.t()) :: String.t()
  def signature_of(word) when not is_binary(word), do: ""

  @spec signature_of(String.t()) :: String.t()
  def signature_of(word) when is_binary(word) == true do
    if not String.valid?(word) do
      ""
    end

    word
    |> to_charlist
    |> Enum.sort()
    |> to_string
  end

  @spec lookup_by_signature(String.t()) :: [String.t()]
  def lookup_by_signature(word) when not is_binary(word), do: []

  @spec lookup_by_signature(String.t()) :: [String.t()]
  def lookup_by_signature(word) when is_binary(word) do
    signature = signature_of(word)

    Repo.Anagram.find_anagrams_by_signature(signature)
    |> Enum.map(& &1.word)
  end
end
