defmodule ElixirApi.Models.Anagram do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "anagrams" do
    field :signature, :string
    field :word, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(anagram, attrs) do
    anagram
    |> cast(attrs, [:signature, :word])
    |> validate_required([:signature, :word])
  end
end
