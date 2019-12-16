print "Enter your grade: "
grade = gets.to_i

if grade<=0
	puts "Invalid grade"
	
elsif grade<=5 
	puts "Elementary"

elsif grade<=8
	puts "Middle School"

elsif grade<=12
	puts "High School"

elsif grade>12
	puts "College"

end
