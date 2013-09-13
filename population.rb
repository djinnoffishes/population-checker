# the file you execute on the command line. It will create a menu system and interpret a user's input

require_relative 'lib/setup'
require_relative 'lib/analytics'

class Population

  attr_accessor :analytics

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
  end

  def menu
    system 'clear'
    p "Population Menu"
    p "---------------"
    @analytics.options.each do |opt|
      p "#{opt[:menu_id]}. #{opt[:menu_title]}"
    end
  end

  def run
    stop = false
    while stop != :exit do
      # run the menu
      self.menu
      # grab the choice
      print "Choice: "
      choice = gets.strip.to_i
      # run their choice
      stop = @analytics.run(choice)
      if stop == :exit
        p "Exiting"
      else
        print "\nHit enter to continue "
        gets
      end
    end
  end
end

p = Population.new
p.run