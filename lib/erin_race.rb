class Race
  attr_reader :office, :candidates
            
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate_details)
    candidate = Candidate.new(candidate_details)
    add_candidate(candidate)
    candidate
  end

  def add_candidate(candidate)
    @candidates << candidate
  end

  def open?
    @open
  end

  def close! 
    @open = false
  end

  def winner
    return false if open? 
    candidates.max_by(&:votes)
  end

  # def winner 
  #   if open? 
  #     false
  #   else 
  #     candidates.max_by(&:votes)
  #   end
  # end

  def tie?
    top_two = candidates.map(&:votes).max(2)
    top_two.first == top_two.last 
  end

  # def tie? 
  #   candidates.group_by(&:votes).keys.sort
  # end

  def winners
    @races.filter_map do |race|
      race.winner unless race.tie?
    end
  end

end
