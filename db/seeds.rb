# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
    @q = Question.create(
      ask_text: row[0] + ' or ' + row[1]
      )
    Choice.create(
      text: row[0],
      question_id: @q.id
      )
    Choice.create(
      text: row[1],
      question_id: @q.id
      )
  end

end

load_data_all

@adrian = User.create(email: 'adrian@uu.com', password:'password', password_confirmation:'password')
@ben = User.create(email: 'ben@uu.com', password:'password', password_confirmation:'password')
ben_asks_candidate1_q1 = Ask.create(user_id: @ben.id, question_id: 1, candidate_id: 1)
ben_asks_candidate1_q2 = Ask.create(user_id: @ben.id, question_id: 2, candidate_id: 1)
adrian_asks_candidate1_q1 = Ask.create(user_id: @adrian.id, question_id: 1, candidate_id: 1)


User.create()