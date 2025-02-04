defmodule ElixirApi.Services.Dictionary do
  @spec signature_of(String.t()) :: String.t()
  def signature_of(word) do
    Application.get_env(:elixir_api, :dictionary, DictionaryImpl).signature_of(word)
  end

  @spec lookup_by_signature(String.t()) :: [String.t()]
  def lookup_by_signature(word) do
    Application.get_env(:elixir_api, :dictionary, DictionaryImpl).lookup_by_signature(word)
  end
end
