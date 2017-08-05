include RSpec
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'

describe "#improving_complexity_version_one" do
  it "returns sorted list of arrays" do
    arr1 = [1, 5, 3]
    arr2 = [4, 2, 6]
    expect(improving_complexity_version_one(arr1, arr2)).to eq [1, 2, 3, 4, 5, 6]
  end

  it "returns sorted list of just one array" do
    arr1 = [1, 5, 3]
    expect(improving_complexity_version_one(arr1)).to eq [1, 3, 5]
  end
end

describe "#improving_complexity_version_two" do
  it "returns sorted list of arrays" do
    arr1 = [1, 5, 3]
    arr2 = [4, 2, 6]
    expect(improving_complexity_version_two(arr1, arr2)).to eq [1, 2, 3, 4, 5, 6]
  end

  it "returns sorted list of just one array" do
    arr1 = [1, 5, 3]
    expect(improving_complexity_version_two(arr1)).to eq [1, 3, 5]
  end
end
