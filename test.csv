For each row in the database I want to create a new database entry that maps constituency id to row0 etc., party id to candidate, candidate name to name, twitter handle to twitter.


- Create table in the database with same columns as in the CSV file
- Transfer each row into the CSV-file to the database
- Database contains same data


require 'pg'
require 'sequel'
require 'csv'

class CSVReader
  def initialize(path)
    @path = path
  end

  def rows
  @rows ||= CSV.read(@path, headers:true)
  end
end

class DatabaseHandler
  attr_reader :db

  TABLE_NAME = "my_table"

  def initialize(data_uri)
    @db = Sequel.connect(database_uri)
  end

  def create_table
    @db.create_table?(TABLE_NAME) do
      primary_key :id
      Integer :pa_id
      String :constituency
      Integer :candidate
      String :current_holder
      String :region
      String :name
      String :twitter
      end
    end

  def table
    @db[TABLE_NAME]
  end
end

class Transferrer
  def initialize(table)
    @table = table
  end

  def transfer(rows)
    rows.each do |row|
      transfer_row(row)
    end
  end

  private 

  def transfer_row(row)
    data = extract_data(row)
    @table.insert(data)
  end

  def row_map
    {
      pa_id: "pa_id",
      constituency: "constituency",
      candidate: "candidate",
      current_holder: "current holder",
      region: "region",
      name: "name",
      twitter: "twitter"
    }
  end

  # (This method maps the columns from the CSV row to valid columns in the database,
  # using the map we defined in #row_map)

  def extract_data(row)
    row_map.each_with_object({}) do |(db_column, row_column), output|
      output[db_column] = row[row_column]
    end
  end
end

reader = CSVReader.new("./data.csv")
db_handler = DatabaseHandler.new("postgres://url_to_my_db")
db_handler.create_table
transferrer = Transferrer.new(db_handler.table)
transferrer.transfer(reader.rows)