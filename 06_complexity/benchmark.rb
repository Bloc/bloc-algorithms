require 'benchmark'
require_relative 'poorly_written_ruby'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'

array_1 = []
array_2 = []
for i in (0..100)
  array_1.push(i)
  array_2.push(i + 101)
end
array_1 = array_1.shuffle
array_2 = array_2.shuffle

Benchmark.bm do |x|
  x.report("Base case:   ") { 1000.times { poorly_written_ruby(array_1, array_2) } }
  x.report("Version one: ") { 1000.times { improving_complexity_version_one(array_1, array_2) } }
  x.report("Version two: ") { 1000.times { improving_complexity_version_two(array_1, array_2) } }
end
