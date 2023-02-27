class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
    @preferences = Array.new
  end

  def add_preference(new_preference)
    @preferences << new_preference
  end

  def tall_enough?(ride_height)
    @height >= ride_height
  end
end
