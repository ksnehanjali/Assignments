words = ["HELLO", "COUNTRY", "BETTER", "THANKS", "MOIST", "COLLEGE", "BEAST", "CLEAN", "STAMP", "POINTY", "DRUMSTICK", "PEACH"]

#puts selected_word

puts
40.times {	print "-" }
puts
puts "WELCOME TO HANGMAN!!"
40.times {	print "-" }
puts
puts

ch = 'P'

while true

	puts "Press enter to Play!"
	puts "Press X to Exit!"
	ch = gets.chomp.upcase

	break if ch == 'X'

	index = rand(words.length)
	num = words[index].length
	selected_word = words[index]
	chances = 5
	output = Array.new(num,'_')
	ch_indices = Array.new

	while chances>0
		
		output.each { |a| print "#{a} "}

		print "\t#{chances} chances remaining!"
		puts

		print "\nEnter you guess:\t"
		guess_ch = gets.chomp.upcase
		puts	
		
		if not /\A[a-zA-Z]\Z/.match?(guess_ch)
			puts "That's not an alphabet!"
			puts

		elsif selected_word.include?guess_ch
			puts "Correct!"

			#ch_indices = selected_word.chars.each_with_index.select{ |char,index| char == guess_ch }.map{ |pair| pair.last}

			selected_word.chars.each_with_index do |a,i|
				if a == guess_ch
					ch_indices.push(i)				
				end			
			end			
			
			ch_indices.each { |i| output[i] = guess_ch }
			ch_indices.clear

		else
			puts "Sorry! Please try again!"
			chances -= 1
		end

		if selected_word.eql?(output.join)
			output.each { |a| print "#{a} "}
			break
		end
		
	end


	puts
	puts
	40.times { print "-"}
	puts

	if chances==0
		puts "The word was #{selected_word}"
		puts "Sorry! You lose!!"
	else
		puts "Congratulations! You win!!"
	end

	40.times { print "-"}
	puts
	puts
end
