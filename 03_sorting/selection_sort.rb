def selection_sort(collection)
  length = collection.length

  # Iterates over all elements in the collection (except the last one - it'll
  # already be sorted by the time we get there). Outer loop.
  for i in 0..length - 2

    # The index to the lowest value. Will always be set to the outer loop's
    # index, as everything to the left of this index is already sorted.
    min_index = i

    # Iterate over everything to the right of `i`
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        # If the value at the inner loop's index is less than the value at the
        # current minimum index, then we update min_index with j.
        min_index = j
      end
    end

    # Swap the value at the front of the unsorted collection with the min_index
    tmp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = tmp
  end
  collection
end
