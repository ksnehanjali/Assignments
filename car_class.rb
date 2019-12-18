class Car									# Class in an entity used to define a template for it.

	# Making use of attribute accessors is used to avoid a lot of number of separate getters and setters of various variables.
	# This makes the length of code lesser. 

	attr_accessor :car_name, :make, :cost 	# Atrribute accessor is used to get and set the values of instance variables from outside the class
	attr_reader :id											# Attribute reader is used to get the values of instance variables from outside the class
	attr_writer :review, :rating 								# Attribute reader is used to set the values of instance variables from outside the class

	@@id = 0
	@@make 

	def self.get_make(make)						# This method is a class method, this is indicated by the self keyword.
		@@make = make
	end

	def initialize(car_name, cost)			# This method is the constructor and those below are instance methods.
		@@id+=1
		@car_name = car_name
		@cost = cost
	end

	private												#This method is a private method and hence can only be used within the class.								
	def calc_total_cost()
		total_cost = @cost.to_i * 0.9
	end	

	public												# Public access specifier allows access of these functions from outside the class.
	def show_info()
		puts "ID: #{@@id}"
		puts "Name: #{@car_name}"
		puts "Make: #{@@make}"
		puts "Cost: #{calc_total_cost} INR"
		puts
		puts "Review: #{@review}"
		puts "Rating: #{@rating} stars"
	end
end

Car.get_make("Honda")
car_obj = Car.new("City","120000")			# new keyword is used to create an object of a class.

car_obj.review = "This is a really good car."
car_obj.rating = "5"

puts
car_obj.show_info