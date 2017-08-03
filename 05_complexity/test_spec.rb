include RSpec
require_relative 'test'

describe "#binary_search_iterative" do
  it "returns correct index" do
    arr = [1,2,3,4,5,6,7,8]
    expect(binary_search_iterative(arr, 6)).to eq 5
  end
end

describe "#sort" do
  it "returns sorted collection" do
    arr = [4,3,5,1,2]
    expect(sort(arr)).to eq [1,2,3,4,5]
  end

  it "sorts an already sorted array" do
    arr = [1,2,3,4,5]
    expect(sort(arr)).to eq [1,2,3,4,5]
  end
end
