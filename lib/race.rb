class Race
  attr_reader :office, :candidates
            
  def initialize(office)
    @office = office
    @candidates = []
  end

  # def register_candidate!(candidate_details)
  #   candidate = Candidate.new(candidate_details)
  # end

  # def add_candidate(candidate)
  #   @candidates << candidate
  # end

  # def register_candidate!(candidate_details)
  #   candidate = Candidate.new(candidate_details)
  #   @candidates << candidate
  # end

  def register_candidate!(candidate_details)
    candidate = Candidate.new(candidate_details)
    add_candidate(candidate)
    candidate
  end

  def add_candidate(candidate)
    @candidates << candidate
  end


end #final
