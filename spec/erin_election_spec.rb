require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/erin_election'

RSpec.describe Election do
  describe "#initialize" do
    it "can initialize and has attributes" do
      election = Election.new("2023")
      expect(election).to be_a(Election)
      expect(election.year).to eq("2023")
    end 
  end

  describe "#add_race" do
    it "can add and log races" do
      election = Election.new("2023")
      race = Race.new("Texas Governor")
      expect(election.races).to eq([])
      election.add_race(race)
      expect(election.races).to eq([race])
    end
  end

  describe "#candidates" do
    it "can return list of candidates" do
      election = Election.new("2023")
      race1 = Race.new("Texas Governor")
      race2 = Race.new("Texas Lt. Governor")
      election.add_race(race1)
      election.add_race(race2)
      expect(election.candidates).to eq([])
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race2.register_candidate!({name: "Roberto R", party: :democrat})
      expect(election.candidates).to eq([candidate1, candidate2])
    
    end
  end

end