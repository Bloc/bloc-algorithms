def heap_sort(collection)
  # Short circuit if collection is empty or doesn't exist.
  return collection if collection == [] || collection == nil

  # Turn collection into a max heap
  for i in (1..(collection.length - 1))
    heapify(collection, i)
  end

  last_unsorted_index = collection.length

  while last_unsorted_index > 0
    # The element at zero index will be the greatest. We swap that with the
    # last unsorted element.
    swap(collection, 0, last_unsorted_index - 1)

    # Everything from the current last_unsorted_index to the right is now
    # sorted. We decreased last_unsorted_index by one to correctly mark the last
    # unsorted index.
    last_unsorted_index -= 1

    # With a lower number at the top of the heap, we sort it down the heap.
    sift_down(collection, 0, last_unsorted_index)
  end

  collection
end

def heapify(collection, index)
  # Find parent index. Might be nil if current index is 0
  parent_index = parent(index)

  # Bubble up the greater value
  while parent_index && collection[parent_index] < collection[index]
    # Demote parent, promote child at index
    swap(collection, index, parent_index)

    # New index is the parent_index
    index = parent_index

    # Get new parent
    parent_index = parent(index)
  end
end

def swap(collection, x, y)
  temp = collection[x]
  collection[x] = collection[y]
  collection[y] = temp
end

def sift_down(collection, index, size)
  # Find children
  left = left(collection, index, size)
  right = right(collection, index, size)

  # Short circuit if no children.
  return if !left && !right

  # Sets greatest index. There's never a case where there is a right and not a
  # left since we fill left to right and remove right to left.
  greatest = left
  greatest = right if left && right && collection[left] < collection[right]

  # Will continue to execute until there is no more children or the element is
  # greater than it's children.
  while greatest && collection[greatest] > collection[index]
    # Swaps with the child that is the greatest
    swap(collection, greatest, index)

    # Sets the index to the child index just swapped
    index = greatest

    # Finds new left and right
    left = left(collection, index, size)
    right = right(collection, index, size)

    # Finds new greatest (or nil if no child)
    greatest = left
    greatest = right if left && right && collection[left] < collection[right]
  end
end

def parent(index)
  return nil if index == 0

  # The parent node will be half the index and minus one (account for zero
  # indexing).
  (index.to_f / 2).round - 1
end

def left(collection, index, size)
  left_index = (index * 2) + 1
  left_index < size ? left_index : nil
end

def right(collection, index, size)
  right_index = (index * 2) + 2
  right_index < size ? right_index : nil
end
