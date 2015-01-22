class Candidate < ActiveRecord::Base
  belongs_to :constitency
  has_many :asks
end
