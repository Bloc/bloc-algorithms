require 'benchmark'
# require_relative '../01_introduction/fibonacci_iterative.rb'
# require_relative 'fibonacci_recursive.rb'

# Benchmark.bm do |x|
#   x.report("Recursion: ") { fib(20) }
# end

require_relative 'binary_search_iterative'
require_relative 'binary_search_recursive'

iterative = Class.new { extend BinarySearchIterative }
recursion = Class.new { extend BinarySearchRecursive }
arr = []
(0..100000).each { |num| arr.push(num) }

Benchmark.bm do |x|
  x.report("Recursion: ") { recursion.bs_re(arr, 17427) }
  x.report("Iterative: ") { iterative.bs_it(arr, 17427) }
end
