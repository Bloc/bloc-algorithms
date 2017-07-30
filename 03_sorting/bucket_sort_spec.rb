include RSpec

require_relative 'bucket_sort'

describe "#bucket_sort" do
  it "sorts a collection correctly" do
    expect(bucket_sort([2, 10, 3, 4, 6, 8, 5, 7, 9, 1], 2)).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it "handles an empty collection" do
    expect(bucket_sort([], 2)).to eq []
  end

  it "handles a collection ordered backwards" do
    expect(bucket_sort([5,4,3,2,1], 2)).to eq [1,2,3,4,5]
  end
end
