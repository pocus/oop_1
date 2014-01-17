class Taxer
	
	def initialize
		@basic_rate  = 0.10
		@duty_rate = 0.05
		@nearest = 20.0	
	end

	def calculate(item)
		tax_collected = 0.00 #shouldn't persist for the life of the Taxer object
		if item.is_imported then tax_collected = (item.price * @duty_rate * @nearest).ceil / @nearest end
		
		if item.is_exempt
			tax_collected
		elsif !item.is_exempt
			tax_collected = tax_collected + ((item.price * @basic_rate * @nearest).ceil / @nearest)
			tax_collected.round(2)
		end
	end

end

class CartItem
	attr_reader :qty, :name, :price, :is_imported, :is_exempt 

	#instance variables are vital to the functioning of a object
	#without object variables you'd only have method variables which die
	#note that attr_reader / access takes whatever variables you put in and adds the "@" because the purpose of the
	#attr snippets is to create readeable / writable instance variables, by definition.

	def initialize(input_line)
 		@qty = 0
 		@name = ""
 		@is_imported = false
 		@is_exempt = false 
 		@price = 0.0
 		
		input_ary = input_line.split(" ") #convert to array <spc> delimited
		
		@qty = input_line[0].to_i

		if input_ary.include?("imported") 
			@is_imported = true
		end

		if input_ary.include?("pills") 
			@is_exempt = true
		elsif input_ary.include?("chocolates")
			@is_exempt = true
		elsif input_ary.include?("chocolate")
			@is_exempt = true
		elsif input_ary.include?("book")
			@is_exempt = true
		end

		@name = input_ary[1..input_ary.index("at")-1]
		@price = input_ary[input_ary.index("at") + 1].to_f

 	end


end

class Receipt

	def initialize(cart_ary)
		@taxer = Taxer.new

		items_total = 0.0
		total_taxes = 0.0
		
		cart_ary.each {|item| total_taxes = total_taxes + @taxer.calculate(item)}
		cart_ary.each {|item| items_total = items_total + item.price}
		cart_ary.each {|item| puts "#{item.qty} #{item.name.join(" ")} : #{(item.price + @taxer.calculate(item)).round(2) }" }

		puts "Sales taxes: #{total_taxes.round(2)}"
		puts "Total: #{(items_total + total_taxes).round(2)}"

	end

end


cart_ary = []

cart_ary[0] = CartItem.new("1 imported bottle of perfume at 27.99")
cart_ary[1] = CartItem.new("1 bottle of perfume at 18.99")
cart_ary[2] = CartItem.new("1 packet of headache pills at 9.75")
cart_ary[3] = CartItem.new("1 box of imported chocolates at 11.25")

# cart_ary[0] = CartItem.new("1 book at 12.49")
# cart_ary[1] = CartItem.new("1 music CD at 14.99")
# cart_ary[2] = CartItem.new("1 chocolate bar at 0.85")

# cart_ary[0] = CartItem.new("1 imported box of chocolates at 10.00")
# cart_ary[1] = CartItem.new("1 imported bottle of perfume at 47.50")


receipt = Receipt.new(cart_ary)

