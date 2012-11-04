sodas = [
	{:name => 'ginger_ale', :qty => 4}, 
	{:name => 'coke', :qty => 6},
	{:name => 'pepsi', :qty => 1}, 
	{:name => 'root_beer', :qty => 3},
]

def soda_machine(sodasQty)
	puts "Type 'dispense' if you're thirsty for a soda, or type 'reload' if you're feeling giving"
	user_input = gets.chomp

	if user_input == 'dispense'

		start_over = 0
		while start_over == 0

			puts "Please select from:"

			n = 0
			while n < 4
				if sodasQty[n][:qty] > 0
					puts "#{sodasQty[n][:name]}"
				end
				n += 1
			end
			
			soda_name_input = gets.chomp

			if soda_name_input == 'ginger_ale'
				if sodasQty[0][:qty] > 0
					puts "here is your ginger ale"
					sodasQty[0][:qty] -=1
					puts "now there are #{sodasQty[0][:qty]} ginger ales left"
					start_over = 1
				else
					puts "there are none left. please choose another"
					start_over = 0
				end
			elsif soda_name_input == 'coke'
				if sodasQty[1][:qty] > 0
					puts "here is your coke"
					sodasQty[1][:qty] -=1
					puts "now there are #{sodasQty[1][:qty]} cokes left"
					start_over = 1
				else
					puts "there are none left. please choose another"
					start_over = 0
				end
			elsif soda_name_input == 'pepsi'
				if sodasQty[2][:qty] > 0
					puts "here is your pepsi"
					sodasQty[2][:qty] -=1
					puts "now there are #{sodasQty[2][:qty]} pepsis left"
					start_over = 1
				else
					puts "there are none left. please choose another"
					start_over = 0
				end
			elsif soda_name_input == 'root_beer'
				if sodasQty[3][:qty] > 0
					puts "here is your root beer"
					sodasQty[3][:qty] -=1
					puts "now there are #{sodasQty[3][:qty]} root beers left"
					start_over = 1
				else
					puts "there are none left. please choose another"
					start_over = 0
				end
			else
				puts "that is not a valid soda choice. please try again."
				start_over = 0
			end
		end
	elsif user_input == 'reload'
		puts "What soda do you want to reload?"
		
		i = 0
		while i < 4
			puts "#{sodasQty[i][:name]}"
			i += 1
		end
		
		soda_reload_input = gets.chomp

		puts "Enter how many sodas are being reloaded"
		soda_quantity_reload = gets.chomp.to_i

		if soda_reload_input == 'ginger_ale'
			sodasQty[0][:qty] += soda_quantity_reload
			puts "There are now #{sodasQty[0][:qty]} ginger ales left."
		elsif soda_reload_input == 'coke'
			sodasQty[1][:qty] += soda_quantity_reload
			puts "There are now #{sodasQty[1][:qty]} cokes left."
		elsif soda_reload_input == 'pepsi'
			sodasQty[2][:qty] += soda_quantity_reload
			puts "There are now #{sodasQty[2][:qty]} pepsis left."
		elsif soda_reload_input == 'root_beer'
			sodasQty[3][:qty] += soda_quantity_reload
			puts "There are now #{sodasQty[3][:qty]} root beers left."
		end
	else
		puts "not a valid choice. try again."
	end
end

soda_machine(sodas)