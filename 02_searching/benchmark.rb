require 'benchmark'
# require_relative '../01_introduction/fibonacci_iterative.rb'
require_relative 'fibonacci_recursive.rb'

Benchmark.bm do |x|
  x.report("Recursion: ") { fib(20) }
end
