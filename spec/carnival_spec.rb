require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival1 = Carnival.new("2 weeks")
    @carnival2 = Carnival.new("3 weeks")
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @ride4 = Ride.new({ name: 'Tilt-a-whirl', min_height: 50, admission_fee: 3, excitement: :thrilling })
    @ride5 = Ride.new({ name: 'Lazy River', min_height: 30, admission_fee: 1, excitement: :gentle})
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor4 = Visitor.new('Barbara', 70, '$20')
    @visitor5 = Visitor.new('Samuel', 80, '$1000')

    @carnival1.add_ride(@ride1, @ride2, @ride3)
    @carnival2.add_ride(@ride4, @ride5)
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:thrilling)
    @visitor5.add_preference(:thrilling)
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor5)
  end

  it "exists" do
    expect(@carnival1).to be_a(Carnival)
  end

  it "has attributes" do
    expect(@carnival1.length).to eq("2 weeks")
    expect(@carnival2.length).to eq("3 weeks")
    expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
    expect(@carnival2.rides).to eq([@ride4, @ride5])
  end

  it "can report most popular ride" do
    expect(@carnival1.most_popular_ride).to eq(@ride3)
  end
  
  it "can report most profitable ride" do
    expect(@carnival1.most_profitable_ride).to eq(@ride2)
  end

  it "can calculate total revenue" do
    expect(@carnival1.total_revenue).to eq(16)
  end

end