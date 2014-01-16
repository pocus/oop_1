
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
		@basic_rate  = 0.10
		@duty_rate = 0.05
		@tax_collected = 0.0
	end

	def smart_run(item)
		if item.is_imported
			puts "calculating duty ..."
			@tax_collected = item.price * @duty_rate
			puts @tax_collected
		end

		if item.is_exempt
			puts "exempt but duty is "
			puts @tax_collected
			return @tax_collected
		end

		puts "tax collected is"
		
		@tax_collected = @tax_collected + (item.price * @basic_rate)
		puts @tax_collected
	end
end

# class DutyTaxer < BasicTaxer
# 	@duty_rate = 0.05
# end

class CartItem

	attr_reader :qty, :name, :price, :is_imported, :is_exempt #why does @ not work?

#instance variables are vital to the functioning of a object
#without object variables you'd only have method variables which die
#note that attr_reader / access takes whatever variables you put in and adds the "@" because the purpose of the
#attr snippets is to create readeable / writable instance variables, by definition.

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
 		puts "no at #{qty}" #aauggggh remember that @var is the actual name
 		puts @qty
 		puts @name
 		puts @is_exempt
 		puts @is_imported
 		puts @price
 	end
end

book = CartItem.new
#book.write
taxer = Taxer.new
taxer.smart_run(book)