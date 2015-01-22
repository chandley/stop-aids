class TwitterHost
   def check_tweet
    answer_tweet = $twitter.search( "to:chrisrhandley", 
                      result_type: "recent"
                    ).first
    question_tweet = $twitter.status(answer_tweet.in_reply_to_status_id)
    puts question_tweet.text
    puts answer_tweet.text
  end
end