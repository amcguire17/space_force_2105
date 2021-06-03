require './lib/spacecraft'

RSpec.describe Spacecraft do
  it "exists" do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    expect(daedalus).to be_a(Spacecraft)
  end

  it "has attributes" do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    expect(daedalus.name).to eq('Daedalus')
    expect(daedalus.fuel).to eq(400)
  end
end
