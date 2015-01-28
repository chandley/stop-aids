class Question < ActiveRecord::Base
  has_many :answers
  has_many :asks
  has_many :choices
  has_many :candidates, through: :answers

  def create_answer(responder, choice)
    answers.create(candidate: responder, choice: choice)
    # Answer.create(candidate_id: responder.id, choice_id: choice.id, question_id: self.id)
  end

  def answered_by?(responder)
    candidates.include?(responder)
  end

  def asked_count(responder)
    Ask.where(candidate_id: responder.id, question_id: self.id).count
  end

  def asked_more_times_than(candidate,threshold)
    self.asked_count(candidate) > threshold
  end

end
