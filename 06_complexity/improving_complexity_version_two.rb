# This method takes n arrays as input and combine them in sorted ascending  order
def improving_complexity_version_two(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array.concat(array)
  end

  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    sorted_array = insert_val(val, sorted_array)
  end

  # Return the sorted array
  sorted_array
end

def insert_val(val, collection, first = 0, last = collection.length-1)
  mid = (first + last) / 2

  return collection.insert(mid, val) if collection[mid] == val

  if mid == first && mid == last
    return collection.insert(mid, val) if val < collection[mid]
    return collection.insert(mid + 1, val)
  end

  return collection.insert(mid, val) if val < collection[mid] && mid == first
  return collection << val if val > collection[mid] && mid == last

  if val > collection[mid]
    return insert_val(val, collection, mid + 1, last)
  else
    return insert_val(val, collection, first, mid - 1)
  end
end
