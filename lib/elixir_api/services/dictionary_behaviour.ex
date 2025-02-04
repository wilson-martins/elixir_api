defmodule ElixirApi.Services.DictionaryBehaviour do
  @callback lookup_by_signature(String.t()) :: list(String.t())
  @callback signature_of(String.t()) :: String.t()
end
