# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def load_data_all
  CSV.foreach('app/assets/data/candidates.csv') do |row|
    Candidate.create(
      constituency_id: row[0], 
      name: row[5], 
      party_id: row[2],
      twitter: row[6]
      )
  end

  CSV.foreach('app/assets/data/constituency.csv') do |row|
    Constituency.create(
      pa_id: row[0],
      name: row[1]
      )
  end

  CSV.foreach('app/assets/data/parties.csv') do |row|
    Party.create(
      party_id: row[0],
      name: row[1]
      )
  end

  CSV.foreach('app/assets/data/questions.csv') do |row|
    Question.create(
      ask_text: row[0]
      )
  end

end

load_data_all