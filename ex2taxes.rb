#Sales tax
# class Cart



	# def get_items
	# 	puts "Another item? (y/n)"
	# 	another_item? = gets.chomp
	# 	if another_item = "y" then get_line
	# end


#	def get_line
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
		puts price
		puts price.class

		puts is_imported
		puts is_exempt



		

