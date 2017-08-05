require_relative '../03_sorting/heap_sort.rb'
# This method takes n arrays as input and combine them in sorted ascending  order
def improving_complexity_version_three(*arrays)
  return nil if !arrays.kind_of?(Array)

  # I think this results in little additional space required and it should be constant since we are
  combined_array = arrays.delete_at(0)
  while arr = arrays.delete_at(0)
    combined_array.concat(arr)
  end

  # Reused my heap_sort. I also refactored my heap_sort to sort in place (took an iterative approach instead of recursion).
  return heap_sort(combined_array)
end
