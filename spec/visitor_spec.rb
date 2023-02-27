require visitor.rb

RSpec.describe Visitor do

  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it "exists" do
    expect(@visitor1).to be_a(Visitor)
  end

  it "has attributes" do 
    expect(@visitor1.name).to eq("Bruce")
    expect(@visitor1.height).to eq("54")
    expect(@visitor1.spending_moneyt).to eq(10)
    expect(@visitor1.preferences).to be_a(Array)
  end

  it "can add to preferences array" do
    visitor1.add_preference(:gentle)
    visitor1.add_preference(:water)

    expect(visitor1.preferences).to eq([:gentle, :water])
  end

  it "can determine whether height is sufficient for a given requirement" do
    expect(visitor1.tall_enough?(54)).to be(true)
    expect(visitor2.tall_enough?(54)).to be(false)
    expect(visitor3.tall_enough?(54)).to be(true)
    expect(visitor1.tall_enough?(64)).to be(false)
  end
end