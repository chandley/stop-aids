class User < ActiveRecord::Base
  has_many :asks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  
end
