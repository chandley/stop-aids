class Question < ActiveRecord::Base
  has_many :answers
  has_many :asks

  def create_answer(responder, answer_text)
    Answer.create(candidate_id: responder.id, response: answer_text, question_id: self.id)
  end

  def answered_by?(responder)
    Answer.where(candidate_id: responder.id, question_id: self.id).count == 0 ? false : true 
  end

  def asked_count(responder)
    Ask.where(candidate_id: responder.id, question_id: self.id).count
  end

  def send_as_tweet(candidate_twitter_address = '@chrisrhandley')
    $twitter.update(candidate_twitter_address + ' '+self.ask_text)
  end

end
