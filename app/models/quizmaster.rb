class Quizmaster

  

   def check_tweet
    answer_tweet = $twitter.search( "to:chrisrhandley", 
                      result_type: "recent"
                    ).first
    question_tweet = $twitter.status(answer_tweet.in_reply_to_status_id)
    
    puts 'making answer'
    Answer.create(candidate_id: 1, response: answer_tweet.text, question_id: 1)
   
  end

  def popular_questions(candidate)
    candidate.questions_asked_more_times_than(2)
  end



end
