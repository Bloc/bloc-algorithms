# Algorithms

A guide to my exploration of algorithms and efficiency.

## 01 - Introduction

Simply created a fibonacci sequence iteratively.

## 02 - Searching

- Studied linear search (iterating through an array, list, linked list, or any type of collection). Relatively slow (O(n)), but necessary if the collection is unsorted.
- Studied and built binary search, both recursively and iteratively. Faster than linear (O (log n)), but requires the collection to be sorted.
  - Worth noting that Ruby does not optimize for tail recursion. So even if the last call is the recursive call, we still just add that recursive call to the stack, which can lead to a significant bump in memory usage. Languages (i.e. Elixir) optimize for the tail recursion. As long as the final call in a function is the recursive call, then the function will remove itself from the calling stack.
- Benchmarked Ruby fibonacci implementations iterative vs recursive for fib(30):
```
              user       system     total      real
Iterative:    0.000000   0.000000   0.000000   (0.000004)
Recursion:    0.000000   0.000000   0.000000   (0.000006)
```

## 03 - Sorting

- **Insertion Sort.** Iterates over an unsorted collection and inserts each element in its preferred location in a new collection. O(n^2). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/insertion_sort.rb)
- **Selection Sort.** Sorts the collection by iterating over it and moving the lowest ranking element found to the end of the sorted front of the collection. O(n^2). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/selection_sort.rb)
- **Bubble Sort.** Operates by comparing two adjacent items at a time in a collection. Continues to iterate over a collection until no more swaps can be made. O(n^2). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/bubble_sort.rb)
- **Merge Sort.** Breaks a collection of n items into n sub-collections. Each collection of one item is considered sorted, by definition. Merge sort then merges individual sub-collections to produce sorted sub-collections. It does this repeatedly until there are no sub-collections to sort. O(n log n). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/merge_sort.rb)
- **Quick Sort.** Extremely efficient divide and conquer algorithm. First, it picks a pivot point. Second, it iterates over the collection and compares each item to the pivot. If greater, it moves to the right of the pivot, if less it shifts one element to the left. After all items that are greater than pivot point have been moved, quick sort recursively applies the previous step to the left and right sides of the collection. O(n^2), but if we handle the pivot correctly we can achieve a very efficient O(n log n). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/quick_sort.rb)
- **Heap Sort.** Arrange collection into a max heap. Continually swap top of heap (greatest value) with the last index in the unsorted partition of the collection. Resort the heap, update the last index in the unsorted partition. Continue until unsorted position contains only one element. O(n log n). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/heap_sort.rb)
- **Bucket Sort.** Distributes elements of a collection within designated index ranges into buckets as and then uses another sorting method on each bucket. O(n^2), but in most cases O(n+k). [Link to my code](https://github.com/davelively14/bloc-algorithms/blob/master/03_sorting/bucket_sort.rb)
