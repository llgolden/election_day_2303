require 'rspec'
require './lib/candidate'

RSpec.describe Candidate do
  it "exists" do
    diana = Candidate.new({name: "Diana D", party: :democrat})
    expect(diana).to be_a(Candidate)
  end 

  xit "has attributes" do
    diana = Candidate.new({name: "Diana D", party: :democrat})
  
    expect(diana.name).to eq("Diana D")
    expect(diana.party).to eq(:democrat)
  end

end



# pry(main)> diana.votes
# => 0

# pry(main)> diana.vote_for!

# pry(main)> diana.vote_for!

# pry(main)> diana.vote_for!

# pry(main)> diana.votes
# => 3

# pry(main)> diana.vote_for!

# pry(main)> diana.votes
# => 4
