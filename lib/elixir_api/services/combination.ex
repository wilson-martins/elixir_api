defmodule ElixirApi.Services.Combination do
  def subsets([]), do: [[]]

  def subsets([head | tail]) do
    tail_subsets = subsets(tail)
    tail_subsets ++ Enum.map(tail_subsets, &[head | &1])
  end
end
