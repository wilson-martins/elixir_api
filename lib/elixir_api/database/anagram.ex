defmodule ElixirApi.Repo.Anagram do
  import Ecto.Query, warn: false

  alias ElixirApi.Repo
  alias ElixirApi.Models.Anagram

  @doc """
  Returns the list of anagrams.

  ## Examples

      iex> list_anagrams()
      [%Anagram{}, ...]

  """
  @spec list_anagrams() :: [Anagram]
  def list_anagrams do
    Repo.all(Anagram)
  end

  @doc """
  Gets a single anagram.

  Raises `Ecto.NoResultsError` if the Anagram does not exist.

  ## Examples

      iex> get_anagram!(123)
      %Anagram{}

      iex> get_anagram!(456)
      ** (Ecto.NoResultsError)

  """
  def get_anagram!(id), do: Repo.get!(Anagram, id)

  @doc """
  Searches for a list of anagrams by signature.

  Returns [] if no data could be found.

  ## Examples

      iex> find_anagrams_by_signature("abc")
      [%Anagram{}]

      iex> find_anagrams_by_signature("aaa")
      []

  """
  def find_anagrams_by_signature(signature) do
    from(a in Anagram, where: a.signature == ^signature)
    |> Repo.all()
  end

  @doc """
  Creates a anagram.

  ## Examples

      iex> create_anagram(%{field: value})
      {:ok, %Anagram{}}

      iex> create_anagram(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_anagram(attrs \\ %{}) do
    %Anagram{}
    |> Anagram.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates multiple anagrams.

  ## Examples

      iex> create_anagrams([
      ...>   %{field: value1},
      ...>   %{field: value2}
      ...> ])
      {:ok, count}

      iex> create_anagrams([
      ...>   %{field: bad_value}
      ...> ])
      {:error, %Ecto.Changeset{}}

  """
  def create_anagrams(anagrams) do
    timestamp = DateTime.utc_now() |> DateTime.truncate(:second)

    anagrams_with_timestamps =
      Enum.map(anagrams, fn anagram ->
        Map.put(anagram, :inserted_at, timestamp)
        |> Map.put(:updated_at, timestamp)
      end)

    {count, _} = Repo.insert_all(Anagram, anagrams_with_timestamps)
    {:ok, count}
  end

  @doc """
  Updates a anagram.

  ## Examples

      iex> update_anagram(anagram, %{field: new_value})
      {:ok, %Anagram{}}

      iex> update_anagram(anagram, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_anagram(%Anagram{} = anagram, attrs) do
    anagram
    |> Anagram.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a anagram.

  ## Examples

      iex> delete_anagram(anagram)
      {:ok, %Anagram{}}

      iex> delete_anagram(anagram)
      {:error, %Ecto.Changeset{}}

  """
  def delete_anagram(%Anagram{} = anagram) do
    Repo.delete(anagram)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking anagram changes.

  ## Examples

      iex> change_anagram(anagram)
      %Ecto.Changeset{data: %Anagram{}}

  """
  def change_anagram(%Anagram{} = anagram, attrs \\ %{}) do
    Anagram.changeset(anagram, attrs)
  end
end
