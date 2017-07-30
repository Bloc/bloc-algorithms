def quick_sort(collection, head = 0, last = collection.length - 1)
  sorted = partition(collection, head, last)
  quick_sort(collection, head, sorted - 1) if sorted > head
  quick_sort(collection, sorted + 1, last) if sorted < last
  collection
end

def partition(collection, head, subject)
  index = head
  high_head_index = head

  while index < subject
    if collection[index] <= collection[subject]
      swap(collection, index, high_head_index)
      index += 1
      high_head_index += 1
    else
      index += 1
    end
  end

  swap(collection, subject, high_head_index)
  return high_head_index
end

def swap(collection, x, y)
  return false if !collection[x] || !collection[y]
  temp = collection[x]
  collection[x] = collection[y]
  collection[y] = temp
  return true
end
