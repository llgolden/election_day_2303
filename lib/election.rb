class Election
  attr_reader :year, :races
            
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates

  end

  def vote_counts
    
  end

end #final
