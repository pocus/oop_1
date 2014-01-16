
# cart_ary = []

	# def fill_cart
	# 	another_item = "y"
	# 	while another_item == "y" 
	# 		get_line
	# 		puts "Another item? (y/n)"
	# 		another_item = gets.chomp
	# 	end
	# end

class Taxer
	
	def initialize
		@basic_rate  = 0.05
	end

	
	def run(item)
		price = item.price
		puts price * @basic_rate
	end
end

# class DutyTaxer < BasicTaxer
# 	@duty_rate = 0.05
# end

class CartItem
	
	attr_accessor :qty, :name, :price, :is_imported, :is_exempt

	def initialize
 		# @qty = 0
 		# @name = ""
 		# @is_imported = false
 		# @is_exempt = false 
 		# @price = 0.0

		puts "Input cart item:"
		keyed_input = gets.chomp #gives a string
		input_ary = keyed_input.split(" ") #convert to array <spc> delimited
		
		@qty = keyed_input[0].to_i

		if input_ary.include?("imported") 
			@is_imported = true
		elsif input_ary.include?("pills") 
			@is_exempt = true
		end

		@name = input_ary[1..input_ary.index("at")-1]
		@price = input_ary[input_ary.index("at") + 1].to_f

 	end

 	def write
 		puts @qty #aauggggh remember that @var is the actual name
 		puts @name
 		puts @is_exempt
 		puts @is_imported
 		puts @price
 	end
end

book = CartItem.new
book.write
taxer = Taxer.new
taxer.run(book)