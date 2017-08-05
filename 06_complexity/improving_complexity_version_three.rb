require_relative '../03_sorting/heap_sort.rb'
# This method takes n arrays as input and combine them in sorted ascending  order
def improving_complexity_version_three(*arrays)
  return nil if !arrays.kind_of?(Array)

  arrays.flatten!

  # Reused my heap_sort. I also refactored my heap_sort to sort in place (took an iterative approach instead of recursion).
  return heap_sort(arrays)
end
