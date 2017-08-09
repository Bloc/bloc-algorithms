require_relative 'city'

def create_route(city1, city2, distance)
  city1.add_neighbor(city2, distance)
  city2.add_neighbor(city1, distance)
end

def nearest_neighbor(city)
  for neighbor in city.neighbors
    if !neighbor[:city].visited
      neighbor[:city].visited = true
      return neighbor[:city]
    end
  end

  return nil
end

def find_path(start_city)
  path = [start_city.name]
  current_city = start_city
  current_city.visited = true

  while next_city = nearest_neighbor(current_city)
    path.push(next_city.name)
    current_city = next_city
  end

  return path
end
