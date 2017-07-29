def quick_sort(collection)

end

def partition(collection, head, subject)
  index = head
  higher_head = head

  while index < subject
    if collection[index] <= collection[subject]
      swap(collection, index, higher_head)
      index += 1
      higher_head += 1
    else
      index += 1
    end
  end

  swap(collection, subject, higher_head)
  return higher_head
end

def swap(collection, x, y)
  return false if !collection[x] || !collection[y]
  temp = collection[x]
  collection[x] = collection[y]
  collection[y] = temp
  return true
end
