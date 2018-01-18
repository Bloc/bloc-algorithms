require_relative 'insertion_sort'

def bucket_sort(collection, num_buckets)
  return [] if collection == nil || collection == []
  buckets = []

  # Find max and min values for the collection
  max = collection.max
  min = collection.min

  # Determines the divsor to be used later in an attempt to even out
  # distribution among the buckets. Works best if even distribution across the
  # spectrum.
  magic = ((max - min) / num_buckets) + 1

  # Create empty buckets
  num_buckets.times { buckets.push([]) }

  collection.each do |element_value|
    # For each element_value, establishes it base by subtracting min and then
    # divides by magic, our distribution divsor. For instance, if the element
    # value is 24, min is 19, and magic is 6, then the element will be added to
    # the 0 bucket (note that in Ruby integer division `/` rounds down).
    # It's worth noting that by doing it this way, all of the elements in one
    # bucket are less than the elements in the next bucket.
    buckets[(element_value - min) / magic].push(element_value)
  end

  new_collection = []

  buckets.each do |bucket|
    # For each bucket, conducts insertion_sort
    bucket = insertion_sort(bucket)

    # Concats all the results.
    new_collection.concat bucket
  end

  return new_collection
end
