# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    last_index = sorted_array.length - 1

    for i in (0..last_index)
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      end
    end

    sorted_array << val if sorted_array.length - 1 == last_index
  end

  # Return the sorted array
  sorted_array
end
