require 'benchmark'
require_relative 'poorly_written_ruby'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'

array_1 = []
array_2 = []
for i in (0..100)
  array_1.push(i)
  array_2.push(i + 101)
end
array_1 = array_1.shuffle
array_2 = array_2.shuffle

print "            "
Benchmark.bm do |x|
  x.report("Base case:     ") { 50.times { poorly_written_ruby(array_1, array_2) } }
  x.report("Version one:   ") { 50.times { improving_complexity_version_one(array_1, array_2) } }
  x.report("Version two:   ") { 50.times { improving_complexity_version_two(array_1, array_2) } }
  x.report("Version three: ") { 50.times { improving_complexity_version_three(array_1, array_2) } }
end
