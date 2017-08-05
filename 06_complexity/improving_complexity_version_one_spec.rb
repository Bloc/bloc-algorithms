include RSpec
require_relative 'improving_complexity_version_one'

describe "#poorly_written_ruby" do
  it "returns sorted list of arrays" do
    arr1 = [1, 5, 3]
    arr2 = [4, 2, 6]
    expect(poorly_written_ruby(arr1, arr2)).to eq [1, 2, 3, 4, 5, 6]
  end

  it "returns sorted list of just one array" do
    arr1 = [1, 5, 3]
    expect(poorly_written_ruby(arr1)).to eq [1, 3, 5]
  end
end
