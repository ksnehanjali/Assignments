loop do

	print "Enter a mobile number: "
	mob_no = gets

	if /\A[1-9][0-9]{9}\Z/.match?(mob_no)
		puts "You have entered a valid mobile number."
	else
		puts "You have entered an invalid mobile number."
	end

	puts	
	puts "Press y to enter again, any other key to go ahead!"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


loop do

	print "\nEnter your e-mail address: "
	email = gets

	if  /\A[a-z0-9]+[._]*[a-z0-9]*[@][a-z]+[.][a-z]+[.a-z]*\Z/.match?(email)
		puts "You have entered a valid email address."
	else
		puts "You have entered an invalid email address."
	end

	puts
	puts "Press y to enter again, any other key to go ahead!"
		ch = gets.chomp.upcase
		break if ch!="Y"
end


loop do
	print "\nEnter your name: "
	name = gets

	if  /\A[a-zA-Z]+\s[a-zA-Z]+\Z/.match?(name)
		puts "You have entered a valid name."
	else
		puts "You have entered an invalid name."
	end

	puts
	puts "Press y to enter again, any other key to go ahead!"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


loop do

	print "\nEnter your gender: "
	gender = gets

	if /\A[MFmf]\Z/.match?(gender)
		puts "You have entered a valid gender."
	else
		puts "You have entered an invalid gender."
	end

	puts
	puts "Press y to enter again, any other key to go ahead!"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


loop do

	print "\nEnter the amount: "
	amount = gets

	if /\A[0-9]+[.]*[0-9]{2}\Z/.match?(amount)
		puts "You have entered a valid amount."
	else
		puts "You have entered an invalid amount."
	end

	puts
	puts "Press y to enter again, any other key to go ahead!"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


