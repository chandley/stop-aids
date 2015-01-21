class Constituency < ActiveRecord::Base
  has_many :candidates

  def add_candidate(candidate)
    self.candidates << candidate
  end
end
