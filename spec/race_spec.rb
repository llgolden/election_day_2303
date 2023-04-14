require 'rspec'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  it "exists" do
    race = Race.new("Texas Governor")
    expect(race).to be_a(Race)
  end 

  it "has attributes" do
    race = Race.new("Texas Governor")
  
    expect(race.office).to eq("Texas Governor")
    expect(race.candidates).to eq([])
  end

  it "can contain one candidate" do
    race = Race.new("Texas Governor")

    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})

    # expect(candidate1.class).to be_a(Candidate)
    expect(candidate1.name).to eq("Diana D") 
    expect(candidate1.party).to eq(:democrat) 
  end

  it "can contain multiple candidates" do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    race.add_candidate(candidate1)
    race.add_candidate(candidate2)

    expect(race.candidates).to eq([candidate1, candidate2]) 
  end

end #final


# expect().to eq() 
# expect().to eq() 