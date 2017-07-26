include RSpec

require_relative 'binary_search_iterative'

RSpec.describe BinarySearchIterative, type: Module do
  let(:arr) { [1, 4, 5, 8, 10, 13, 14, 25, 31, 36, 38] }
  let(:bsi) { Class.new { extend BinarySearchIterative } }

  describe "#bs_it" do
    it "returns correct index" do
      expect(bsi.bs_it(arr, 5)).to eq 2
      expect(bsi.bs_it(arr, 38)).to eq 10
    end

    it "returns nil if target not found" do
      expect(bsi.bs_it(arr, 2)).to be_nil
    end
  end
end
