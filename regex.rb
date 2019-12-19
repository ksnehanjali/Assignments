loop do

	print "Enter a mobile number: "
	mob_no = gets

	if /\A[1-9][0-9]{9}\Z/.match?(mob_no)
		print "You have entered a valid mobile number.\n"
	else
		print "You have entered an invalid mobile number.\n"
	end

	print "Press y to enter again, any other key to go ahead!\n"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


loop do

	print "\nEnter your e-mail address: "
	email = gets

	if  /\A[a-z0-9]+[._]*[a-z0-9]*[@][a-z]+[.][a-z]+[.a-z]*\Z/.match?(email)
		print "You have entered a valid email address.\n"
	else
		print "You have entered an invalid email address.\n"
	end

	print "Press y to enter again, any other key to go ahead!\n"
		ch = gets.chomp.upcase
		break if ch!="Y"
end


loop do
	print "\nEnter your name: "
	name = gets

	if  /\A[a-zA-Z]+\s[a-zA-Z]+\Z/.match?(name)
		print "You have entered a valid name.\n"
	else
		print "You have entered an invalid name.\n"
	end

	print "Press y to enter again, any other key to go ahead!\n"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


loop do

	print "\nEnter your gender: "
	gender = gets

	if /\A[MFmf]\Z/.match?(gender)
		print "You have entered a valid gender.\n"
	else
		print "You have entered an invalid gender.\n"
	end

	print "Press y to enter again, any other key to go ahead!\n"
	ch = gets.chomp.upcase
	break if ch!="Y"
end


loop do

	print "\nEnter the amount: "
	amount = gets

	if /\A[0-9]+[.]*[0-9]{2}\Z/.match?(amount)
		print "You have entered a valid amount.\n"
	else
		print "You have entered an invalid amount.\n"
	end

	print "Press y to enter again, any other key to go ahead!\n"
	ch = gets.chomp.upcase
	break if ch!="Y"
end