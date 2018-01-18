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

## 06 - Complexity

1. Find the Big-O of each version and write your work and solution
  - [Version 1](https://github.com/davelively14/bloc-algorithms/blob/master/06_complexity/improving_complexity_version_one.rb)
    - O(n^2), or quadratic time. Our first loop, which creates the combined_array, will in the worst case scenario operate at linear time if all of the arrays passed only contain a single element. But our real trouble begins in the next loop, which is a nested loop. In the worst case scenario, we will have to iterate through every value in all of the arrays while executing the `val in combined_array` for loop while also iterating through all of the already sorted values. While early on sorted_array array will be small, it will eventually reach n. Since we're essentially at O(n * (1+2+3...+n)) = O(n^2 + n)/2 = O(n^2/2 + n/2), we can drop the insignificant n/2. And since the important factor we focus on is the numerator of n^2/2, we just say O(n^2).
    - O(n) space. Since we are creating a second array that contains the sorted elements, and those sorted elements will eventually be the same size as the unsorted array of size n, in both best and worst case scenarios space requirements will increase linearly.
  - [Version 2](https://github.com/davelively14/bloc-algorithms/blob/master/06_complexity/improving_complexity_version_two.rb)
    * O(n^2) time. We still have to iterate through every value in the array in order to put them in the proper order. While we use a divide and conquer approach that operates similarly to recursive binary search to find where we will insert the data, giving us a O(n log n) time for that operation, the Array.insert method will, in the worst case scenario, traverse the entire length of the array. Since that is nested, it means in those cases we will iterate n * n, or O(n^2).
    * O(n log n) space. Since we are creating a second array that contains the sorted elements, and those sorted elements will eventually be the same size as the unsorted array of size n, in both best and worst case scenarios space requirements will increase linearly. Additionally, since we are using recursion in our nested divide and conquer approach, we add additional space requirements at a rate of log n for each element. As a result, we require O(n log n) space.
  - [Version 3](https://github.com/davelively14/bloc-algorithms/blob/master/06_complexity/improving_complexity_version_three.rb)
    * O(n log n) time. Similarly to version 2, we are using a divide and conquer approach. I used an updated version of my previous heap sort method, which executes at the same O(n log n).
    * O(1) space. Initially, my heap_sort used recursion. While that works ok in terms of time performance, that would have required additional, non-constant memory requirements as we go down the recursive rabbit hole. However, I refactored heap_sort to work via iteration. As a result, space requirements are constant as we're not adding anything to memory relative to n.

## 07 - Heuristics

- Implemented nearest neighbor in Ruby:
  - [Link to file](https://github.com/davelively14/bloc-algorithms/blob/master/07_complexity/tsp_greed.rb)
