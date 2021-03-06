require 'csv'

def load_data_all
  CSV.foreach('data/candidates.csv') do |row|
    Candidate.create(
      constituency_id: row[0], 
      name: row[5], 
      party_id: row[2],
      twitter: row[6]
      )
  end

  CSV.foreach('data/constituency.csv') do |row|
    Constituency.create(
      pa_id: row[0],
      name: row[1]
      )
  end

  CSV.foreach('data/parties.csv') do |row|
    Party.create(
      party_id: row[0],
      name: row[1]
      )
  end

  CSV.foreach('data/questions.csv') do |row|
    Question.create(
      ask_text: row[0]
      )
  end

end