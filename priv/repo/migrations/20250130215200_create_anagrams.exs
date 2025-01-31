defmodule ElixirApi.Repo.Migrations.CreateAnagrams do
  use Ecto.Migration

  def change do
    create table(:anagrams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :signature, :string
      add :word, :string

      timestamps(type: :utc_datetime)
    end

    create index(:anagrams, [:signature])
    create unique_index(:anagrams, [:word])
  end
end
