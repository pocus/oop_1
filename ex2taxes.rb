
# cart_ary = []

	# def fill_cart
	# 	another_item = "y"
	# 	while another_item == "y" 
	# 		get_line
	# 		puts "Another item? (y/n)"
	# 		another_item = gets.chomp
	# 	end
	# end

 class CartItem #could you do a hash to represent each item?

 	def initialize
 		@qty = 0
 		@name = ""
 		@is_imported = false
 		@is_exempt = false 
 		@price = 0.0

		puts "Input cart item:"
		keyed_input = gets.chomp #gives a string
		input_ary = keyed_input.split(" ") #convert to array <spc> delimited
		
		@qty = keyed_input[0].to_i

		if input_ary.include?("imported") 
			@is_imported = true
		end

		if input_ary.include?("pills") 
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


# Taxer.run("CartItem")

# finalprice = price + Taxer("price")




# class Taxer
# 	attr_accessor :x, :y
# 	@basic_rate  = 0.05


# 	def initialize 
	
# 	def run(price)
# 		price * rate
# 	end

# end

# class DutyTaxer < BasicTaxer
# 	@duty_rate = 0.05
# end

# #item 1 = CartItem.new(2, book, :imported => true, :exempt => true, 12.49)



