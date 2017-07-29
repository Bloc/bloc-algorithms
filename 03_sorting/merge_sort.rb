def merge_sort(collection)
  if collection.length <= 1
    # Collection is returned if the size is less than or equal to one. A collection of one item is always sorted.
    collection
  else
    # Splits in half and recursively breaks everything down to n collections (i.e. [element])
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])

    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end
