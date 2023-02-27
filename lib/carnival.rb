class Carnival
  attr_reader :length,
              :rides
  def initialize(length)
    @length = length
    @rides = Array.new
  end

  def add_ride(*ride_list)
    @rides.concat(ride_list)
  end

  def most_popular_ride
    @rides.sort_by{ |ride| ride.rider_log.values.sum}.last
  end

  def most_profitable_ride
    @rides.sort_by{ |ride| ride.total_revenue}.last
  end

  def total_revenue
    @rides.map{ |ride| ride.total_revenue}.sum
  end
end
