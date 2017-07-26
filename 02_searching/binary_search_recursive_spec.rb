include RSpec

require_relative 'binary_search_recursive'

RSpec.describe BinarySearchRecursive, type: Module do
  let(:arr) { [1, 4, 5, 8, 10, 13, 14, 25, 31, 36, 38] }
  let(:bsi) { Class.new { extend BinarySearchRecursive } }

  describe "#bs_re" do
    it "returns correct index" do
      expect(bsi.bs_re(arr, 5)).to eq 2
      expect(bsi.bs_re(arr, 38)).to eq 10
    end

    it "returns nil if target not found" do
      expect(bsi.bs_re(arr, 2)).to be_nil
    end
  end
end
