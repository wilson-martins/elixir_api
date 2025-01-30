defmodule ElixirApi.Services.Anagram do
  alias ElixirApi.Services.Combination
  alias ElixirApi.Services.Dictionary

  @spec all_subsets_longer_than_three_characters(String.t()) :: [String.t()]
  defp all_subsets_longer_than_three_characters(word) do
    word
    |> String.codepoints()
    |> Combination.subsets()
    |> Stream.map(&List.to_string/1)
    |> Enum.filter(&(String.length(&1) >= 3))
  end

  @spec as_unique_signatures([String.t()]) :: [String.t()]
  defp as_unique_signatures(subsets) do
    subsets
    |> Stream.map(&Dictionary.signature_of/1)
    |> Enum.uniq()
  end

  @spec find_in_dictionary([String.t()]) :: [String.t()]
  defp find_in_dictionary(signatures) do
    signatures
    |> Stream.map(&Dictionary.lookup_by_signature/1)
    |> Stream.reject(&is_nil/1)
    |> Stream.flat_map(&Enum.to_list/1)
    |> Enum.uniq()
  end

  @spec group_by_length([String.t()]) :: %{integer() => [String.t()]}
  defp group_by_length(words) do
    words
    |> Enum.sort()
    |> Enum.group_by(&String.length/1)
  end

  def anagrams_in(word) do
    word
    |> all_subsets_longer_than_three_characters()
    |> as_unique_signatures()
    |> find_in_dictionary()
    |> group_by_length()
  end
end
