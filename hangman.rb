class Game

	@@words = ["HELLO", "COUNTRY", "BETTER", "THANKS", "MOIST", "COLLEGE", "BEAST", "CLEAN", "STAMP", "POINTY", "DRUMS", "PEACH"]
	@selected_word
	@chances
	@output_word
	@game_run
	@guessed_characters

	def self.initialize_game

		index = rand(@@words.length)
		@selected_word = @@words[index]
		@chances = 5
		@output_word = Array.new(@selected_word.length,'_')
		@guessed_characters = Array.new
		matched_indices = Array.new
		@game_run = true

	end

	def self.get_guessed_character
		print "\nEnter you guess:\t"
		guess_ch = gets.chomp.upcase
	end

	def self.compare_guess(guess_ch)

		if !/\A[a-zA-Z]\Z/.match?(guess_ch)
			puts "That's not an alphabet!\n"

		elsif @guessed_characters.include?(guess_ch)
			puts "\nYou have already guessed this alphabet!\n" 

		elsif @selected_word.include?guess_ch
			puts "\nCorrect!"
			update_player_output(guess_ch)

		else
			puts "\nSorry! Please try again!"
			@chances -= 1
		end

		@guessed_characters.push(guess_ch)

		if @selected_word.eql?(@output_word.join)
			@output_word.each { |a| print "#{a} "}
			@game_run = false
		end

	end


	def self.update_player_output(guess_ch)
		matching_indices = Array.new

		@selected_word.chars.each_with_index do |a,i|
		if a == guess_ch
			matching_indices.push(i)				
			end			
		end			
			
		matching_indices.each { |i| @output_word[i] = guess_ch }
		matching_indices.clear
	end	


	def self.show_result

		puts
		40.times { print "-" }
		puts

		if @chances==0
			puts "The word was #{@selected_word}"
			puts "Sorry! You lose!!"
			@game_run = false
		else
			puts "Congratulations! You win!!"
		end

		40.times { print "-" }
		puts
	end	

	def self.game_play

		while @chances>0

			@output_word.each { |a| print "#{a} "}
			print "\t#{@chances} chances remaining!"
			puts

			guess_ch = get_guessed_character	
			compare_guess(guess_ch)
			
			break if !@game_run
		end
					
		show_result

	end	

end

while true

	Game.initialize_game

	40.times {	print "-" }
	puts
	puts "WELCOME TO HANGMAN!!"
	40.times {	print "-" }
	puts

	Game.game_play

	puts "\nPress enter to play again, X to exit!"
	break if gets.chomp.upcase == 'X'
end
