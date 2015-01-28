class Question < ActiveRecord::Base
  has_many :answers
  has_many :asks
  has_many :choices
  has_many :candidates, through: :answers

  def create_answer(responder, choice)
    answers.create(candidate: responder, choice: choice)
    # Answer.create(candidate_id: responder.id, choice_id: choice.id, question_id: self.id)
  end

  #TODO move to candidate
  def answered_by?(responder)
    candidates.include?(responder)
  end
#TODO move to candidate
  def asked_count(responder)
    asks.where(candidate: responder).count
  end
#TODO move to candidate
  def asked_more_times_than(candidate,threshold)
    self.asked_count(candidate) > threshold
  end

end
