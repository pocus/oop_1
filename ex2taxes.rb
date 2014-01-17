class Taxer
	
	def initialize
		@basic_rate  = 0.10
		@duty_rate = 0.05
	end

	def calculate(item)
		tax_collected = 0.0 #shouldn't persist for the life of the Taxer object

		#calculate duty
		if item.is_imported
			tax_collected = item.price * @duty_rate
		end

		#if tax exempt, return with calculated duty
		if item.is_exempt
			return tax_collected
		end
		
		#dutiable and taxable
		tax_collected = tax_collected + (item.price * @basic_rate)		
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
		elsif input_ary.include?("chocolate")
			@is_exempt = true
		elsif input_ary.include?("book")
			@is_exempt = true
		end

		@name = input_ary[1..input_ary.index("at")-1]
		@price = input_ary[input_ary.index("at") + 1].to_f

 	end


end

taxer = Taxer.new

	@cart_ary = []
	@items_total = 0.0
	@total_taxes = 0.0
	@balance_due = 0.0

	@cart_ary[0] = CartItem.new("1 book at 12.49")
	@cart_ary[1] = CartItem.new("1 music CD at 14.99")
	@cart_ary[2] = CartItem.new("1 chocolate bar at 0.85")

	@cart_ary.each {|item| @total_taxes = @total_taxes + taxer.calculate(item)}
	@cart_ary.each {|item| @items_total = @items_total + item.price}
	#@cart_ary.each {|item| @balance_due = @items_total + item.price}

	puts "total_taxes is #{@total_taxes}"
	puts "@balance_due is #{@items_total + @total_taxes}"
