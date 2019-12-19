class Restaurant
	
	#attr_accessor :status_index
	
	@name
	@menu
	@order
	@@status = [ "Waiting for order", "Order Placed..!", "Your order is on its way..!", "Order delivered!", "Order cancelled." ]
	@@status_index = 0

	def initialize(name, menu)
		@name = name
		@menu = menu
		@order = []
	end

	def show_menu
		puts
		40.times { print "-"}
		puts
		puts "Menu of #{@name}"
		40.times { print "-"}
		puts
		@menu.each_with_index { |item, index| puts "#{index+1} #{item.keys[0]}" }
	end	

	def accept_order(choice, quantity)
		item = [ @menu[choice.to_i-1], quantity ]
		@order.push(item)
		show_order
	end	

	def show_order()
		puts
		puts "Your Order:  "
		puts
		print "\tItem\t\tQuantity"
		@order.each { |item| print "\n #{ item[0].keys[0] }\t\t\t#{item[1]} \n" }
		
		@@status_index += 1
		puts
		puts @@status[@@status_index]
	end	

	def check_availability(choice, quantity)
		@menu.each do |item|
			item.each do |key,value|
				
				#puts "Key = #{key} and value = #{value} and choice = #{ @menu[choice.to_i-1].keys[0]}" 

				if key == @menu[choice.to_i-1].keys[0] and value == true
					accept_order(choice, quantity)
				
				elsif key == @menu[choice.to_i-1].keys[0] and value == false
					puts "Sorry! This item is currently not available"	
				
				end

			end
				
		end	
	end	

	def update_status()
		@@status_index += 1
		puts @@status[@@status_index]
		return @@status_index
	end	

end

vaishali_menu = [ {"Dahi wada" => true}, {"Pani Puri" => false}, {"Samosa" => false}, {"Dosa" => true} ]
eatsome_menu = [ {"Cheesy Potato Wrap" => true}, {"Chicken Wrap" => false}, {"Egg Wrap" => true}, {"Paneer wrap" => false} ]
chaitanya_menu = [ {"Paratha" => true}, {"Veg Biryani" => true}, {"Egg Rice" => false} ]

menus = [vaishali_menu, eatsome_menu, chaitanya_menu]
puts

restaurants_name = [ "VAISHALI", "EATSOME", "CHAITANYA PARATHAS"]

40.times { print "-" }
puts
puts "Restaurants available"
40.times { print "-" }
puts

restaurants_name.each_with_index { |name, index| puts "#{index+1}. #{name}" }
puts "Please select a restaurant: "
selected_restaurant = gets.chomp.upcase

index = restaurants_name.find_index(selected_restaurant)

restaurant_obj = Restaurant.new(selected_restaurant,menus[index])
restaurant_obj.show_menu

print "\nEnter your choice: "
choice = gets.chomp

print "\nEnter required quantity: "
quantity = gets.chomp.to_i

restaurant_obj.check_availability(choice, quantity)

puts
puts

current_status = 0
while current_status <=3 	
	sleep(4)
	current_status = restaurant_obj.update_status
	#if ch.upcase == "X"
	#	puts "Order cancelled."
	#	break
	#end

end
