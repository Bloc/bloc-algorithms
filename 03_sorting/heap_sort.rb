def heap_sort(collection)
  return collection if collection == [] || collection == nil
  for i in (1..(collection.length - 1))
    sort_max_heap(collection, i)
  end

  size = collection.length

  while size > 0
    swap(collection, 0, size - 1)
    size -= 1
    sift_down(collection, 0, size)
  end

  collection
end

def sort_max_heap(collection, index)
  parent_index = parent(index)

  if parent_index && collection[parent(index)] < collection[index]
    swap(collection, index, parent_index)
    sort_max_heap(collection, parent_index)
  end
end

def swap(collection, x, y)
  temp = collection[x]
  collection[x] = collection[y]
  collection[y] = temp
end

def sift_down(collection, index, size)
  left = left(collection, index, size)
  right = right(collection, index, size)
  return if !left && !right

  highest = left
  highest = right if left && right && collection[left] < collection[right]

  if highest && collection[highest] > collection[index]
    swap(collection, highest, index)
    sift_down(collection, highest, size)
  end
end

def parent(index)
  return nil if index == 0
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
