class Result
	attr_accessor :student_name, :id, :marks

	@@id = 0
	@@stud_percentage = []

	def initialize(student_name, marks)
		@student_name = student_name
		@@id += 1
		@marks = marks
	end
		
	def calc_percentage()
		total_marks = @marks.sum
		percentage = total_marks/3
		@@stud_percentage.push(percentage)

		percentage
	end

	def self.max_percentage()
		@@stud_percentage.max
	end	
end

for i in 0..2

	marks = Array.new

	print "Enter the name of student #{i+1} : "
	name = gets.chomp

	puts "Enter week wise marks of student:"
	for i in 0..2
		print "Week #{i+1}: "
		marks[i] = gets.chomp.to_i
	end
	
	result = Result.new(name, marks)
	puts "Percentage: #{result.calc_percentage}"

end

puts "Maximum percentage: #{Result.max_percentage}"