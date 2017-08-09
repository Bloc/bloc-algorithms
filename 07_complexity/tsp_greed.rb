require_relative 'city'

def create_route(city1, city2, distance)
  city1.add_neighbor(city2, distance)
  city2.add_neighbor(city1, distance)
end
