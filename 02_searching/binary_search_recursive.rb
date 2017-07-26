module BinarySearchRecursive
  def bs_re(arr, target)
    find_target(0, arr.length - 1, arr, target)
  end

  def find_target(low, high, arr, target)
    mid = ((high + low).to_f / 2).floor

    return mid if arr[mid] == target
    return nil if low >= high
    return find_target(low, mid - 1, arr, target) if arr[mid] > target
    return find_target(mid + 1, high, arr, target)
  end
end
