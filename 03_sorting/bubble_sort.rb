def bubble_sort(collection)
  n = collection.length

  # Start begin-end-until loop. Iterates until we no longer need to swap.
  begin
    swapped = false

    # Iterate over the length of the collection each pass.
    (n - 1).times do |i|
      # If the first element is greater than the second element, swap and set
      # swapped to true. If this condition is never met, swapped will remain
      # set to false and the begin-end-until loop will exit.
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
end
