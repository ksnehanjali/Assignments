class Restaurant
    
  @name
  @menu
  @order
  @order_cost
  @@status = [ "Waiting for order", "Order Placed..!", "Food is being prepared..", "Your order is on its way..!", "Order delivered!"]
  @@status_index = 0

  def initialize(name, menu)
    @name = name
    @menu = menu
    @order = []
    @order_cost = 0
  end

  def show_menu
    puts
    40.times { print "-"}
    puts "\nMenu of #{@name}"
    40.times { print "-"}
    puts
    @menu.each_with_index { |item, index| puts "#{index+1} #{item.keys[0]}\t#{item[:cost]}" }
  end 

  def accept_order(choice, quantity)
    item = [ @menu[choice.to_i-1], quantity ]
    @order.push(item)
    @order_cost += @menu[choice.to_i-1][:cost].to_f*quantity
  end 

  def show_order()
    puts "\nYour Order:  "
    puts "\tItem\t\tQuantity\t\t\n"
    40.times { print "-"}
    puts
    @order.each { |item| print "#{ item[0].keys[0] }\t\t\t#{item[1]}\t\t\n" }
    puts "\nTotal cost: #{@order_cost} INR\n\n"
    @@status_index += 1
    puts @@status[@@status_index]
  end 

  def check_availability(choice, quantity)
    @menu.each do |item|
      item.each do |key,value|
        
        if key == @menu[choice.to_i-1].keys[0] and value == true
          accept_order(choice, quantity)
        elsif key == @menu[choice.to_i-1].keys[0] and value == false
          puts "Sorry! This item is currently not available"  
          return
        end
      end       
    end 
  end 

  def update_status()
    @@status_index += 1
    puts "#{@@status[@@status_index]}\n"
    return @@status_index
  end 

end

vaishali_menu = [ {"Dahi wada" => true, :cost => "100"}, {"Pani Puri" => false, :cost => "80"}, {"Samosa" => true, :cost => "30"}, {"Dosa" => true, :cost=>"80"} ]
eatsome_menu = [ {"Cheesy Potato Wrap" => true, :cost => "70"}, {"Chicken Wrap" => false, :cost => "120"}, {"Egg Wrap" => true, :cost => "90"}, {"Paneer wrap" => true, :cost => "110"} ]
chaitanya_menu = [ {"Paratha" => true, :cost => "120"}, {"Veg Biryani" => true, :cost => "150"}, {"Egg Rice" => false, :cost => "90"} ]

menus = [vaishali_menu, eatsome_menu, chaitanya_menu]
puts

restaurants_name = [ "VAISHALI", "EATSOME", "CHAITANYA PARATHAS"]

40.times { print "-" }
puts
puts "Restaurants available"
40.times { print "-" }
puts

restaurants_name.each_with_index { |name, index| puts "#{index+1}. #{name}" }
puts "Please enter the name of the restaurant: "
selected_restaurant = gets.chomp.upcase

index = restaurants_name.find_index(selected_restaurant)

restaurant_obj = Restaurant.new(selected_restaurant,menus[index])
restaurant_obj.show_menu

while true
  print "\nEnter your choice: "
  choice = gets.chomp.to_i

  if choice>menus[index].length or choice<=0
    puts "Invalid choice.."
    next
  end 

  print "\nEnter required quantity: "
  quantity = gets.chomp.to_i

  restaurant_obj.check_availability(choice, quantity)
  puts "Press enter to add more items, otherwise press X!"
  break if gets.chomp.upcase=='X'
end

puts
puts "Items added successfully..."

restaurant_obj.show_order

current_status = 0
while current_status <= 3 
  sleep(4)
  current_status = restaurant_obj.update_status
end
