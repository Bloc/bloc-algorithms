class City
  attr_accessor :name, :visited
  attr_reader :neighbors

  def initialize(name)
    @name = name
    @neighbors = []
    @visited = false
  end

  # We'll compare nearest neighbor when adding the neighbor to the city.
  def add_neighbor(city, distance)
    # Set indicies
    low = 0
    high = @neighbors.length - 1
    mid = 0

    # If first neighbor (i.e. @neighbors length - 1 is less than zero), adds
    # to the @neighbors instance variable.
    @neighbors.push({city: city, distance: distance}) if high < 0

    # Uses binary search to find right location before inserting. Sorting on
    # insert prevents searching for nearest neighbor later.
    while low <= high
      mid = (high + low) / 2

      if @neighbors[mid][:distance] > distance
        high = mid - 1
      elsif @neighbors[mid][:distance] < distance
        low = mid + 1
      else
        @neighbors.insert(mid, {city: city, distance: distance})
        break
      end
    end

    if @neighbors[mid][:distance] > distance
      @neighbors.insert(mid, {city: city, distance: distance})
    elsif @neighbors[mid][:distance] < distance && mid == @neighbors.length - 1
      @neighbors.push({city: city, distance: distance})
    else
      @neighbors.insert(mid + 1, {city: city, distance: distance})
    end
  end
end
