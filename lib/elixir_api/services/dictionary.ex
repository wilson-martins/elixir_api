defmodule ElixirApi.Services.Dictionary do
  @spec signature_of(String.t()) :: String.t()
  def signature_of(word) do
    word |> to_charlist |> Enum.sort() |> to_string
  end

  @spec lookup_by_signature(String.t()) :: [String.t()]
  def lookup_by_signature(word) do
    signature = signature_of(word)

    File.read!("./assets/words.txt")
    |> String.downcase()
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(signature_of(String.downcase(&1)) == signature))
    |> Enum.uniq()
  end
end

# IO.puts("Dictionary service loaded")
# alias ElixirApi.Services.Dictionary
# IO.inspect(Dictionary.lookup_by_signature("woken"))
