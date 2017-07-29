defmodule Sort do
  def merge_sort([]), do: []
  def merge_sort([elem]), do: [elem]
  def merge_sort(list) do
    mid = list |> length |> div(2)
    {left, right} = list |> Enum.split(mid)
    left = left |> merge_sort()
    right = right |> merge_sort()

    merge(left, right)
  end

  #####################
  # Private Functions #
  #####################

  defp merge([], right), do: right
  defp merge(left, []), do: left
  defp merge(left = [head_left | tail_left], right = [head_right | tail_right]) do
    if head_left < head_right, do: [head_left | merge(tail_left, right)], else: [head_right | merge(left, tail_right)]
  end
end

ExUnit.start()

defmodule SortTest do
  use ExUnit.Case

  describe "#merge_sort" do
    test "Leave already sorted as sorted" do
      sorted = Sort.merge_sort([10,1,8,2,7,3,6,9,4,5])
      assert [1,2,3,4,5,6,7,8,9,10] == sorted
    end

    test "Accepts empty list" do
      sorted = Sort.merge_sort([])
      assert [] == sorted
    end

    test "Sort reverse list" do
      sorted = Sort.merge_sort([5,4,3,2,1])
      assert [1,2,3,4,5] == sorted
    end

    test "Sort negative numberst" do
      sorted = Sort.merge_sort([-1,-2,-3])
      assert [-3,-2,-1] == sorted
    end
  end
end
