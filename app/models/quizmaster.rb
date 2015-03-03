class Quizmaster

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
    #TODO assumes database id is pa_id
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
