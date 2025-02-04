ExUnit.start()

Mox.defmock(ElixirApi.Services.DictionaryBehaviourMock,
  for: ElixirApi.Services.DictionaryBehaviour
)

Application.put_env(:elixir_api, :dictionary, ElixirApi.Services.DictionaryBehaviourMock)
