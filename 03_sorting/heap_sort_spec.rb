include RSpec

require_relative 'heap_sort'

describe "#heap_sort" do
  it "sorts a collection correctly" do
    expect(heap_sort([2, 10, 3, 4, 6, 8, 5, 7, 9, 1])).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it "handles an empty collection" do
    expect(heap_sort([])).to eq []
  end

  it "handles a collection ordered backwards" do
    expect(heap_sort([5,4,3,2,1])).to eq [1,2,3,4,5]
  end
end

describe "#heapify" do
  it "turns a collection into a max heap" do
    collection = [1, 5, 3, 2, 4]
    for i in (1..(collection.length - 1))
      heapify(collection, i)
    end
    expect(collection).to eq [5, 4, 3, 1, 2]
  end
end
