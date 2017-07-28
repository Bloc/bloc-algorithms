include RSpec

require_relative 'merge_sort'

describe "#merge_sort" do
  it "does something" do
    expect(merge_sort([2, 1, 3, 4])).to eq [1, 2, 3, 4]
  end
end
