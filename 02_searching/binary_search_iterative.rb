module BinarySearchIterative
  def bs_it(arr, target)
    low = 0
    high = arr.length - 1

    while low <= high
      mid = ((high + low).to_f / 2).floor

      if arr[mid] > target
        high = mid - 1
      elsif arr[mid] < target
        low = mid + 1
      else
        return mid
      end
    end

    return nil
  end
end
