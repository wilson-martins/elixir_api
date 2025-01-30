defmodule ElixirApi.Services.Dictionary do
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

    File.read!("./assets/words.txt")
    |> String.downcase()
    |> String.split("\n")
    |> Enum.map(&String.replace(&1, "\r", ""))
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(signature_of(String.downcase(&1)) == signature))
    |> Enum.uniq()
  end
end
