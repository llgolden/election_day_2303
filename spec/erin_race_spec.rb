require 'rspec'
require './lib/candidate'
require './lib/erin_race'

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

    expect(candidate1.name).to eq("Diana D") 
    expect(candidate1.party).to eq(:democrat) 
  end

  it "can contain multiple candidates" do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

    expect(race.candidates).to eq([candidate1, candidate2]) 
  end

  describe "#open?" do
    it "is open by default" do
      race = Race.new("Texas Governor")
      expect(race.open?).to be(true)
    end
  end

  describe "#close!" do
    it "can close a race" do
      race = Race.new("Texas Governor")
      race.close!
      expect(race.open?).to be(false)
    end
  end

  describe "#winner" do 
    it "can declare a winner if race is closed" do 
      race1 = Race.new("Texas Governor")
      race2 = Race.new("Texas Lt. Governor")
      race3 = Race.new("Colorado District 5 Rep")
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :democrat})
      candidate3 = race2.register_candidate!({name: "Zelda Z", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Alex A", party: :democrat})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      
      4.times { candidate1.vote_for! }
      1.times { candidate2.vote_for! }
      race1.close!

      expect(race1.winner).to eq(candidate1)
    end

    it "does not declare winner if race is not closed" do 
      race1 = Race.new("Texas Governor")
      race2 = Race.new("Texas Lt. Governor")
      race2 = Race.new("Texas Lt. Governor")
      race3 = Race.new("Colorado District 5 Rep")
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :democrat})
      candidate3 = race2.register_candidate!({name: "Zelda Z", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Alex A", party: :democrat})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
   
      4.times { candidate1.vote_for! }
      1.times { candidate2.vote_for! }

      expect(race1.winner).to eq(false)
    end
  end

  describe "#winner" do
    it "can determine if there is a tie" do
      race1 = Race.new("Texas Governor")
      race2 = Race.new("Texas Lt. Governor")
      race2 = Race.new("Texas Lt. Governor")
      race3 = Race.new("Colorado District 5 Rep")
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :democrat})
      candidate3 = race1.register_candidate!({name: "Zelda Z", party: :democrat})
      candidate4 = race1.register_candidate!({name: "Alex A", party: :democrat})
  
      3.times { candidate1.vote_for! }
      4.times { candidate2.vote_for! }
      1.times { candidate3.vote_for! }
      3.times { candidate4.vote_for! }
      race1.close! 
      expect(race1.tie?).to be(false)
      candidate1.vote_for!
      expect(race1.tie?).to be(true)
      expect(race1.winner).to eq(candidate1).or eq(candidate2)

    end
  end

end 
 