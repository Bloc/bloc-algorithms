require 'benchmark'
require_relative 'bubble_sort'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'selection_sort'

def build_collection(num = 50)
  collection = []
  for i in (0..num)
    collection.push(i)
  end
  return collection.shuffle
end

Benchmark.bm do |x|
  x.report("Bubble sort:      ") { 10.times {bubble_sort(build_collection)} }
  x.report("Bucket sort (2):  ") { 10.times {bucket_sort(build_collection, 2)} }
  x.report("Bucket sort (3):  ") { 10.times {bucket_sort(build_collection, 3)} }
  x.report("Bucket sort (4):  ") { 10.times {bucket_sort(build_collection, 4)} }
  x.report("Bucket sort (10): ") { 10.times {bucket_sort(build_collection, 10)} }
  x.report("Heap sort:        ") { 10.times {heap_sort(build_collection)} }
  x.report("Insertion sort:   ") { 10.times {insertion_sort(build_collection)} }
  x.report("Merge sort:       ") { 10.times {merge_sort(build_collection)} }
  x.report("Quick sort:       ") { 10.times {quick_sort(build_collection)} }
  x.report("Selection sort:   ") { 10.times {selection_sort(build_collection)} }
end

Benchmark.bm do |x|
  x.report("Bubble sort:      ") { 10.times {bubble_sort(build_collection(500))} }
  x.report("Bucket sort (2):  ") { 10.times {bucket_sort(build_collection(500), 2)} }
  x.report("Bucket sort (3):  ") { 10.times {bucket_sort(build_collection(500), 3)} }
  x.report("Bucket sort (4):  ") { 10.times {bucket_sort(build_collection(500), 4)} }
  x.report("Bucket sort (10): ") { 10.times {bucket_sort(build_collection(500), 10)} }
  x.report("Heap sort:        ") { 10.times {heap_sort(build_collection(500))} }
  x.report("Insertion sort:   ") { 10.times {insertion_sort(build_collection(500))} }
  x.report("Merge sort:       ") { 10.times {merge_sort(build_collection(500))} }
  x.report("Quick sort:       ") { 10.times {quick_sort(build_collection(500))} }
  x.report("Selection sort:   ") { 10.times {selection_sort(build_collection(500))} }
end
