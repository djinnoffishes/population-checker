# call the CSVReader class and create an Area instance for each row

require_relative 'csv_reader'
require_relative 'area'

class Setup

  def initialize
    csv = CSVReader.new("/.free-zipcode-database")
    @areas = []
    csv.read do |ch|
      @areas << Area.new(ch)
    end
    self
  end

end