class User < ActiveRecord::Base
  has_many :asks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def get_constituency_pa_id_from_postcode(postcode)
    pa_id = $twfy.constituency(postcode: postcode).pa_id
  end

  def asks_to(candidate, question)
    Ask.create(candidate_id: candidate.id, 
               question_id:  question.id, 
               user_id:      self.id  
              )
  end

  def questions_asked_to(candidate)
    asks_to_candidate = self.asks.where(:candidate_id == candidate.id)
    return asks_to_candidate.map {|ask| Question.find(ask.question_id)}
  end

  def asked_questions_answered_by(candidate)
    questions_asked_to(candidate).select {|question| question.answer}
  end

  def answered_questions_asked_to(candidate)
    questions_asked_to(candidate).select {|question| candidate.has_answered?(question)}
  end
  
end
