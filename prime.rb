print "Enter a number : "
num = gets.to_i

if num==0
	puts "Please enter a valid number."

elsif num==1
	puts "1 is neither composite nor prime."

else
	flag = true
	for i in 2..num/2
		if num%i==0
			flag = false			
			break
		end
	end

	puts "Prime!" if flag==true
	puts "Not Prime!" if flag==false
	
end


