puts "Printing a to z in reverse order"
30.times { print "-" }

alphabet = ('a'..'z').to_a
puts
puts alphabet.reverse.join(', ')

