include RSpec
require_relative 'city'
require_relative 'tsp_greed'

RSpec.describe City, type: Class do
  let(:charlotte) { City.new("Charlotte") }
  let(:atlanta) { City.new("Atlanta") }

  describe "#initialize" do
    it "initializes correctly" do
      city = City.new("Savannah")
      expect(city.name).to eq "Savannah"
      expect(city.neighbors).to eq []
      expect(city.visited).to eq false
    end
  end

  describe "#add_neighbor" do
    it "adds the neighbor correctly" do
      charlotte.add_neighbor(atlanta, 244)
      atlanta.add_neighbor(charlotte, 244)

      expect(charlotte.neighbors[0][:city]).to eq atlanta
      expect(charlotte.neighbors[0][:distance]).to eq 244

      expect(atlanta.neighbors[0][:city]).to eq charlotte
      expect(atlanta.neighbors[0][:distance]).to eq 244
    end
  end
end

describe "#create_route" do
  let(:charlotte) { City.new("Charlotte") }
  let(:atlanta) { City.new("Atlanta") }
  let(:savannah) { City.new("Savannah") }

  it "creates neighbors in each city" do
    create_route(charlotte, atlanta, 244)

    expect(charlotte.neighbors[0][:city]).to eq atlanta
    expect(charlotte.neighbors[0][:distance]).to eq 244

    expect(atlanta.neighbors[0][:city]).to eq charlotte
    expect(atlanta.neighbors[0][:distance]).to eq 244
  end

  it "creates neighbors in order" do
    create_route(charlotte, savannah, 252)
    create_route(charlotte, atlanta, 244)
    create_route(atlanta, savannah, 248)

    expect(charlotte.neighbors[0][:city]).to eq atlanta
    expect(charlotte.neighbors[0][:distance]).to eq 244

    expect(atlanta.neighbors[0][:city]).to eq charlotte
    expect(atlanta.neighbors[0][:distance]).to eq 244

    expect(savannah.neighbors[0][:city]).to eq atlanta
    expect(savannah.neighbors[0][:distance]).to eq 248
  end
end

describe "#nearest_neighbor" do
  let(:charlotte) { City.new("Charlotte") }
  let(:atlanta) { City.new("Atlanta") }
  let(:savannah) { City.new("Savannah") }

  before do
    create_route(charlotte, atlanta, 244)
    create_route(charlotte, savannah, 252)
    create_route(atlanta, savannah, 248)
  end

  it "returns nearest neighbor and marks visited" do
    expect(atlanta.visited).to be false
    neighbor = nearest_neighbor(savannah)
    expect(neighbor).to eq atlanta
    expect(atlanta.visited).to be true

    neighbor = nearest_neighbor(savannah)
    expect(neighbor).to eq charlotte
    expect(charlotte.visited).to be true
  end

  it "returns nil if we run out of neighbors" do
    nearest_neighbor(savannah)
    nearest_neighbor(savannah)
    expect(nearest_neighbor(savannah)).to be_nil
  end
end

describe "#find_path" do
  let(:charlotte) { City.new("Charlotte") }
  let(:atlanta) { City.new("Atlanta") }
  let(:savannah) { City.new("Savannah") }
  let(:columbia) { City.new("Columbia") }

  before do
    create_route(charlotte, atlanta, 244)
    create_route(charlotte, savannah, 252)
    create_route(charlotte, columbia, 93)

    create_route(atlanta, savannah, 248)
    create_route(atlanta, columbia, 214)

    create_route(savannah, columbia, 157)
  end

  it "text" do
    expect(nearest_neighbor(columbia)).to eq charlotte
    expect(nearest_neighbor(columbia)).to eq savannah
  end

  it "returns correct path" do
    expect(find_path(charlotte)).to eq ["Charlotte", "Columbia", "Savannah", "Atlanta"]
  end
end
