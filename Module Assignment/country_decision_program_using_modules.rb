module GetLoan
  def loan_from_IMF? population, gdp, states, state_of_country
    population >= 1.0 && gdp >= 1.5 && states >= 15 && state_of_country == :developing
  end

  def loan_from_World_Bank? population, gdp, state_of_country
    population >= 1.2 && gdp >= 1.5 && (state_of_country == :developing or state_of_country == :developed)
  end  
end

module SeatInUN
  def get_seat_in_UN? population, gdp, state_of_country
    population >= 1.0 && gdp >= 2.0 && (state_of_country == :developing or state_of_country == :developed)
  end  
end

module WinWar
  def can_win_war? gdp, army_strength
    gdp >= 1.0 && army_strength >= 0.05
  end
end

class CountryCheck
  extend GetLoan, SeatInUN, WinWar

  @population
  @gdp
  @states
  @army_strength
  @state_of_country

  # Population and army strength in crore
  @@countries_data = [ { :name => "INDIA", :population => 133.92, :gdp => 6.6, :states => 29, :army_strength => 0.12, :state_of_country => :developing},
                   { :name => "USA", :population => 32.72, :gdp => 2.3, :states => 50, :army_strength => 0.13, :state_of_country => :developed},
                   { :name => "RUSSIA", :population => 14.45, :gdp => 1.5, :states => 65, :army_strength => 0.9, :state_of_country => :developing},
                   { :name => "SAUDI ARABIA", :population => 3.29, :gdp => -0.7, :states => 13, :army_strength => 0.01, :state_of_country => :developing} ]

  def self.initialize_with_country_data(country_name)
    @@countries_data.each do |hash|
      hash.each do |key,value|
        if value == country_name
          @population =  hash[:population]
          @gdp = hash[:gdp]
          @states = hash[:states]
          @army_strength = hash[:army_strength]
          @state_of_country = hash[:state_of_country]
        end  
      end  
    end  
  end  

  def self.check_info(choice,country_name)
    
    initialize_with_country_data(country_name)

    case choice
      when 1 
        result = loan_from_IMF? @population, @gdp, @states, @state_of_country
        show_result(result, choice, country_name)
      when 2
        result = loan_from_World_Bank? @population, @gdp, @state_of_country
        show_result(result, choice, country_name)
      when 3
        result = get_seat_in_UN? @population, @gdp, @state_of_country 
        show_result(result, choice, country_name)
      when 4
        result = can_win_war? @gdp, @army_strength
        show_result(result, choice, country_name)
    end   
  end  

  def self.show_result(result, choice, country_name)
    msg = ["get loan from IMF","get loan from World Bank","have seat in United Nations","win war"]
    if result
      puts "#{country_name} can #{msg[choice-1]}"
    else
      puts "#{country_name} can't #{msg[choice-1]}"
    end    
  end  

  def self.show_available_countries
    @@countries_data.each do |hash|
        puts hash[:name]
    end  
  end  
end  

while true
  puts "\nCheck for different countries!\n\n"
  puts "1.Whether country will get loan from IMF?"
  puts "2.Whether country will get loan from World Bank?"
  puts "3.Whether country can have seat in United Nations?"
  puts "4.Whether country can win a war or not?\n\n"

  puts "Enter your choice:"
  choice = gets.chomp.to_i
  if choice<=0 or choice>4
    puts "Invalid choice..!"
    next
  end

  puts "\nAvailable countries\n"
  CountryCheck.show_available_countries

  puts "\nEnter the name of the required country: "
  country_name = gets.chomp.upcase
  CountryCheck.check_info(choice.to_i,country_name)

  puts "\nPress enter to check again or X to exit.\n"
  ch = gets.chomp.upcase
  break if ch == 'X'
end  