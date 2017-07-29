include RSpec

require_relative 'merge_sort'

describe "#merge_sort" do
  it "does something" do
    expect(merge_sort([2, 10, 3, 4, 6, 8, 5, 7, 9, 1])).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end
end
