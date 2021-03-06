class Person
	def initialize(name)
		@name = name
	end

	def greet
		puts "Hi, my name is #{@name}."
	end
end


class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an object."
	end
end

Chris = Instructor.new("Chris")
Chris.greet

Cristina = Student.new("Cristina")
Cristina.greet

Chris.teach
Cristina.learn

Cristina.teach
#Doesn't work because the "teach" method is part of the Instructor class and therefore not accessible to Cristina, which 
#is an object of the Student class. 
