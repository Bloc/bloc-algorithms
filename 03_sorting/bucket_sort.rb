require_relative 'insertion_sort'

def bucket_sort(collection, num_buckets)
  return [] if collection == nil || collection == []
  buckets = []
  max = collection.max
  min = collection.min
  magic = ((max - min) / num_buckets) + 1

  num_buckets.times { buckets.push([]) }

  collection.each do |item|
    buckets[(item - min) / magic].push(item)
  end

  collection = []

  buckets.each do |bucket|
    bucket = insertion_sort(bucket)
    collection.concat bucket
  end

  return collection
end
