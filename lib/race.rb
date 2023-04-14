class Race
  attr_reader :office, :candidates
            
  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(candidate_details)
    # @candidates << candidate
    candidate = Candidate.new(candidate_details)
  end

  def add_candidate(candidate)
    @candidates << candidate
  end


end #final
