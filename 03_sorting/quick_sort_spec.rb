include RSpec

require_relative 'quick_sort'

describe "#quick_sort" do
  it "sorts a collection correctly" do
    expect(quick_sort([2, 10, 3, 4, 6, 8, 5, 7, 9, 1])).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it "handles an empty collection" do
    expect(quick_sort([])).to eq []
  end

  it "handles a collection ordered backwards" do
    expect(quick_sort([5,4,3,2,1])).to eq [1,2,3,4,5]
  end
end

describe "#partition" do
  it "partitions correctly" do
    arr = [12, 7, 14, 9, 10, 11]
    expect(partition(arr, 0, arr.length - 1)).to eq 3
    expect(arr).to eq [7, 9, 10, 11, 14, 12]
  end
end
