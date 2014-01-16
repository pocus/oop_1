	def fill_cart
		another_item = "y"
		while another_item == "y" 
			get_line
			puts "Another item? (y/n)"
			another_item = gets.chomp
		end
	end


	def get_line
		qty = 0
		item_name = ""
		is_imported = false
		is_exempt = false
		price = 0.0

		puts "Input cart item:"
		keyed_input = gets.chomp #gives a string
		input_ary = keyed_input.split(" ") #convert to array <spc> delimited
		
		qty = keyed_input[0].to_i

		if input_ary.include?("imported") 
			is_imported = true
		end

		if input_ary.include?("pills") 
			is_exempt = true
		end

		price = input_ary[input_ary.index("at") + 1].to_f

		#construct item object
		
	end

# class CartItem
# 	def initialize(qty, name, is_imported, is_exempt, price)
# 	end
# end

#item 1 = CartItem.new(2, book, :imported => true, :exempt => true, 12.49)


fill_cart