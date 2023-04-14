class Race
  attr_reader :office, :candidates
            
  def initialize(office)
    @office = office
    @candidates = []
  end


end #final

# The `register_candidate!` method must take a Hash as an argument and return an instance of `Candidate`.