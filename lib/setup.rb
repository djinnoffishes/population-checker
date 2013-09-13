# call the CSVReader class and create an Area instance for each row

require_relative 'csv_reader'
require_relative 'area'

class Setup

  attr_accessor :areas

  def initialize
    csv = CSVReader.new("free-zipcode-database.csv")
    @areas = []
    csv.read do |ch|
      @areas << Area.new(ch)
    end
    self
  end

end