# This method takes n arrays as input and combine them in sorted ascending  order
def improving_complexity_version_one(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array.concat(array)
  end

  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    i = 0
    last_index = sorted_array.length - 1
    while i <= last_index
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == last_index
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end
