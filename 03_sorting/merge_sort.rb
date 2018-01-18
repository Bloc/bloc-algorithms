def merge_sort(collection)
  if collection.length <= 1
    # Collection is returned if the size is less than or equal to one. A
    # collection of one item is always sorted.
    collection
  else
    # Splits in half and recursively breaks everything down to n collections
    # (i.e. [element])
    #
    # 'mid' is the mid index for the collection
    mid = (collection.length / 2).floor

    # 'left' is result of recursive call to merge_sort, which is a sorted array
    left = merge_sort(collection[0..mid - 1])
    # 'right' is result of recursive call to merge_sort, which is a sorted array
    right = merge_sort(collection[mid..collection.length])

    # Calls helper method to sort.
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    # Since both left and right are sorted amongst themselves, we know that the
    # first elements of each are the least. If left is less than right, then we
    # build a new a new array with the lowest element (left.first) and append
    # the result of the recursive call to merge with the rest of left and all of
    # right.
    [left.first] + merge(left[1..left.length], right)
  else
    # Same as above, but the first element of right is lowest.
    [right.first] + merge(left, right[1..right.length])
  end
end
