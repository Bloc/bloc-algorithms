def insertion_sort(collection)
  # Set sorted_collection equal to the first element of the collection to be
  # sorted and removes that element for the collection.
  sorted_collection = [collection.delete_at(0)]

  # Iterate through the remainder of the collection to be sorted
  for val in collection
    sorted_collection_index = 0

    # Iterate through the sorted_collection
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        # If the val in the collection is less than or equal to the value in the
        # sorted collection, will insert the val at that location.
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        # If we reach the end of the sorted_collection, then val is now the
        # largest sorted number and is appended to the end.
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end

      sorted_collection_index += 1
    end
  end

  sorted_collection
end
