class Question < ActiveRecord::Base
  has_many :answers

  def create_answer(responder_id, answer_text)
    Answer.create(candidate_id: responder_id, response: answer_text, question_id: self.id)
  end

end
