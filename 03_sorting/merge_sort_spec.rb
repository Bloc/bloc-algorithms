include RSpec

require_relative 'merge_sort'

describe "#merge_sort" do
  it "sorts a collection correctly" do
    expect(merge_sort([2, 10, 3, 4, 6, 8, 5, 7, 9, 1])).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it "handles an empty collection" do
    expect(merge_sort([])).to eq []
  end

  it "handles a collection ordered backwards" do
    expect(merge_sort([5,4,3,2,1])).to eq [1,2,3,4,5]
  end
end
