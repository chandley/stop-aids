require 'CSV'

party_ids = {
  'Con' => '1', 
  'Green' => '2', 
  'Lab' => '3', 
  'LD' => '4',
  'PC' => '5',
  'UKIP' => '6',
}


CSV.foreach('ppc.csv') do |row|
  party_ids.each do |key, value|
    row[2].gsub!(key, value)
  end
  puts row.to_csv unless (row.include?('no candidate') or row.include?('[New candidate to be selected]'))
end

