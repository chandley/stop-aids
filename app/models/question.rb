class Question < ActiveRecord::Base
  has_many :answers
  has_many :asks

  def create_answer(responder, answer_text)
    Answer.create(candidate_id: responder.id, response: answer_text, question_id: self.id)
  end

end
