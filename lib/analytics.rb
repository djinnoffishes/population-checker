# It will have an Array of area instances which you can loop over and extract various bits of information.

class Analytics

  attr_accessor :options

  def initialize(areas)
    @areas = areas
    set_options
  end

  def set_options
    @options = []
    @options << { menu_id: 1, menu_title: 'Areas count', method: :how_many }
    @options << { menu_id: 2, menu_title: 'Smallest Population (non 0)', method: :smallest_pop }
    @options << { menu_id: 3, menu_title: 'Larest Population', method: :largest_pop }
    @options << { menu_id: 4, menu_title: 'How many zips in California?', method: :california_zips }
    @options << { menu_id: 5, menu_title: 'Information for a given zip', method: :zip_info }
    @options << { menu_id: 6, menu_title: 'Exit', method: :exit }
  end

  def run(choice)
    opt = @options.select {|o| o[:menu_id] == choice }.first
    if opt.nil?
      p "Invalid option."
    elsif opt[:method] != :exit
      self.send opt[:method]
      :done
    else
      opt[:method]
    end
  end

   def how_many
    p "There are #{@areas.length} areas"
  end

  def smallest_pop
    sorted = @areas.sort { |x, y| x.estimated_population <=> y.estimated_population }
    smallest = sorted.drop_while { |i| i.estimated_population == 0 }.first
    p "#{smallest.city}, #{smallest.state} has the smallest population of #{smallest.estimated_population}"
  end

  def largest_pop
    sorted = @areas.sort { |x, y| x.estimated_population <=> y.estimated_population }
    largest = sorted.reverse.drop_while { |i| i.estimated_population == 0 }.first

    p "#{largest.city}, #{largest.state} has the largest population of #{largest.estimated_population}"
  end

  def california_zips
    c = @areas.count { |a| a.state == "CA" }
    p "There are #{c} zip code matches in California"
  end

  def zip_info
    print "Enter zip: "
    zip = gets.strip.to_i
    zips = @areas.select { |a| a.zipcode == zip }
    unless zips.empty?
      p ""
      zips.each { |z| p z }
    else
      p "Zip not found"
    end
  end

end
