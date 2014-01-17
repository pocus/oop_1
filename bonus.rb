#mars rover

# An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.


#5 5 upper right, defines area
#1 2 N initial position and heading
# LMLMLMLMM orders
# 3 3 E initial position rover 2
# MMRMMRMRRM more orders for 2

# 1 3 N final position of 1
# 5 1 E final position fo 2

class Rover

	def initialize(x,y,heading)
		@x = x
		@y = y
		@heading_letter = heading
		@heading_num = 0

		case @heading_letter

			when "N"
				@heading_num = 0

			when "E"
				@heading_num = 1

			when "S"
				@heading_num = 2

			when "W"
				@heading_num = 3

		end


	end


	def receive_order(orders)

		orders = orders.split(//)

		orders.each do |order|

			case order

			when "L"

				if @heading_num == 0
					@heading_num = 3
				else
					@heading_num -=1
				end

			when "R"

				if @heading_num == 3
					@heading_num = 0
				else
					@heading_num +=1
				end


			when "M"

				case @heading_num

					when 0
						@y += 1
					when 1
						@x += 1
					when 2
						@y -= 1
					when 3
						@x -= 1

				end
			end

			puts "#{@x} ... #{@y} .. #{@heading_num}"

		end
	end
end


	# def rotate(direction)
	# 	handle left
	# 	handle right
	# end

rover1 = Rover.new(1,2,"N")
rover1.receive_order("LMLMLMLMM")
puts "rover 2"
rover2 = Rover.new(3,3,"E")
rover2.receive_order("MMRMMRMRRM")