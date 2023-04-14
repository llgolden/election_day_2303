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
    @races.flat_map do |race|
      race.candidates
    end
  end

  # Another option:
  # def candidates
  #   @races.flat_map(&:candidates)
  # end
  # Another option:
  # def candidates
  #   race.candidates.map do |candidates|
  #     candidate
  #   end
  # end.flatten

# -
  # def vote_counts
  #   add_votes 
  #   @vote_counts
  # end

  # def add_votes 
  #   candidates.each do |candidate|
  #     @vote_counts[candidate.name] = candidate.votes
  #   end
  # end
# -

   def add_votes
      votes_by_candidate = Hash.new(0)
      candidates.map do |candidate|
        votes_by_candidate[candidate.name] += candidate.votes 
    end
    votes_by_candidate
  end

  # def vote_counts
  #   vote_counts = Hash.new
  #   candidates.each do |candidate|
  #     vote_counts[candidate.name] = candidate.votes
  #   end
  #   vote_counts
  # end

  def vote_counts
    candidates.map { |candidate| [candidate.name, candidate.votes]}.to_h
  end

end
