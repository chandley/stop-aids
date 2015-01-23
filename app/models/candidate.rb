class Candidate < ActiveRecord::Base
  belongs_to :constitency
  belongs_to :party
  has_many :asks
end
