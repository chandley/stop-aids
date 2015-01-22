class Question < ActiveRecord::Base
  has_many :answers
  has_many :asks

  def create_answer(responder, answer_text)
    Answer.create(candidate_id: responder.id, response: answer_text, question_id: self.id)
  end

  def tweet
    $twitter.update('@chrisrhandley '+self.ask_text)
  end

   def check_tweet
    answer_tweet = $twitter.search( "to:chrisrhandley", 
                      result_type: "recent"
                    ).first
    question_tweet = $twitter.status(answer_tweet.in_reply_to_status_id)
    
      puts 'making answer'
      Answer.create(candidate_id: 1, response: answer_tweet.text, question_id: 1)
   
  end

end
