require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  it "exists" do
    election = Election.new("2023")
    expect(election).to be_a(Election)
  end 

  xit "has attributes" do
  
    expect(election.year).to eq("2023")
    expect(election.races).to eq([])
  end

end


# Use TDD to create an `Election` class that satisfies the following requirements.

# You have been contacted by the local government to create a program that helps track their elections by organizing registered candidates and their votes.

# | Method Name | Return Value |
# | ----------- | ------------ |
# | #new        | An `Election` object that has an attribute of year (string data type). |
# | #year       | The year of the election (string). |
# | #races      | An array of `Race` objects. |
# | #add_race(race)   | An array of `Race` objects. |
# | #candidates | An array of all `Candidate` objects in the election. |
# | #vote_counts | A hash with each candidate's name as a key and their count of votes as the value. |
