class Candidate < ActiveRecord::Base
  belongs_to :constitency
  has_many :asks

  def questions_asked_more_times_than(threshold)
    Question.all.select {|question| question.asked_count(self) > threshold}
  end
end
