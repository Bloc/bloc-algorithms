def quick_sort(collection, head = 0, last = collection.length - 1)
  # partition returns the the index of the where the pivot (last) value rests
  # where all unsorted elements to the lest are less and all unsorted elements
  # to the right are more.
  sorted = partition(collection, head, last)

  # Recursively sorts elements to the left
  quick_sort(collection, head, sorted - 1) if sorted > head

  # Recursively sorts elements to the right
  quick_sort(collection, sorted + 1, last) if sorted < last
  collection
end

def partition(collection, head, last)
  # eval_index tracks the index we will evaluate vs pivot. Since we will start
  # from the beginning of this partition, we set it to head.
  eval_index = head

  # high_partition_index marks the index where the high partition starts.
  # Initially it's set to the beginning of the partition.
  high_partition_index = head

  # Setting pivot to last element of the partition. This sets a worst case
  # condition if we attempt to sort a collection that is already sorted.
  pivot = last

  # Iterate over the partition until we reach the pivot
  while eval_index < pivot
    if collection[eval_index] <= collection[pivot]
      # If the element at the eval_index is less than the value at the pivot,
      # this element must be moved to the left of the high_partition_index.
      swap(collection, eval_index, high_partition_index)

      # Advance the index being evaluated to continue the sort
      eval_index += 1

      # After the swap this currently points to a value that is lower than the
      # pivot. We know that everything to the right is either unevaluated or
      # greater than the pivot, so we can safely advance the
      # high_partition_index.
      high_partition_index += 1
    else
      # Since the element at this index is higher, nothing to do. Simply advance
      # the eval_index.
      eval_index += 1
    end
  end

  # At this point we know that everything to the left of high_partition_index is
  # less than the value at the pivot. Everything to the right of the
  # high_partition_index is greater than the pivot. Therefore, we can simply
  # swap the values in the elements at the high_partition_index and pivot.
  swap(collection, pivot, high_partition_index)

  # After the swap, high_partition_index is currently pointing to the value of
  # the pivot. Since we know that everything to the right is greater and to the
  # left is less, we return the index to the pivot.
  return high_partition_index
end

# Swaps elements
def swap(collection, x, y)
  return false if !collection[x] || !collection[y]
  temp = collection[x]
  collection[x] = collection[y]
  collection[y] = temp
  return true
end
