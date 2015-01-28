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

  def get_constituency_candidates_from_postcode(postcode)
    pa_id = $twfy.constituency(postcode: postcode).pa_id
    constituency = Constituency.find(pa_id.to_i)
    candidates = constituency.candidates
    return {constituency: constituency, candidates: candidates}
  end

  def get_constituency_first_only_candidate_from_postcode(postcode)
    pa_id = $twfy.constituency(postcode: postcode).pa_id
    constituency = Constituency.find(pa_id.to_i)
    candidate = constituency.candidates.first
    return {constituency_name: constituency.name, 
            constituency_pa_id: constituency.pa_id, 
            candidate_name: candidate.name,
            candidate_party_name: candidate.party.name,
            candidate_id: candidate.id
          }
  end

end
