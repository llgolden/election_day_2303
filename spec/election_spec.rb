require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  it "exists" do
    election = Election.new("2023")
    expect(election).to be_a(Election)
  end 

  it "has attributes" do
    election = Election.new("2023")
  
    expect(election.year).to eq("2023")
    expect(election.races).to eq([])
  end

  it "can contain a race" do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    
    expect(election.add_race(race1)).to eq([race1])
  end

  it "can contain multiple races" do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    race2 = Race.new("Denver Mayor")
    election.add_race(race1)
    election.add_race(race2)

    expect(election.races).to eq([race1, race2])
  end

  it "can contain candidates" do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    election.add_race(race1)

    election.candidates(race1, {name: "Diana D", party: :democrat})
    election.candidates(race1, {name: "Roberto R", party: :republican})
# require 'pry'; binding.pry
    # expect(race1.candidates).to eq([Candidate, Candidate]) 
  end

  xit "can display vote counts" do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    election.add_race(race1)
  
    expect(election.vote_counts).to eq({
      candidate1.name => 0,
      candidate2.name => 0
    })

    candidate1.vote_for!
    candidate2.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate1.vote_for!
   
    expect(election.vote_counts).to eq({
      candidate1.name => 5,
      candidate2.name => 4
    })
  end
end
