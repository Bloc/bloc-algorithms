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

  it "stores nearest neighbor in" do

  end
end
