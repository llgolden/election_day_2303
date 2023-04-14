class Election
  attr_reader :year, :races
            
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates(race, candidate_details)
    race.register_candidate!(candidate_details)
  end



  # this method will call the register_candidate! method from the Race class
  # this method will return the Candidate objects for the called race in the election
  # this method will return an array of all Candidate objects in the election


  # def vote_counts

  # end

  # this method will update each time a candidate receives a vote_for! them 
  # this method will return a hash with key = candidate#.name and value = @vote

end
