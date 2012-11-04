#Blackjack
# We refactored code as we got smarter and made the program
# http://www.codeodor.com/index.cfm/2007/3/25/Ruby-random-numbers/1042

=begin

1. Sit down
2. Deal a card to user and dealer
3. Ask "Hit or Stay" 
3a. If Hit, deal a card to user and dealer 
3b. If stay, deal to dealer
4. Total cards
5. Announce winner.
#this is a test for git.

=end
user = {}
dealer = {}


def deal
  #Generating User's card
  x = {} 
  y = {}
  x["value"] = rand(1..11) #sample is a method that randomly pulls an element from an array (http://ruby-doc.org/core-1.9.3/Array.html#method-i-sample)
  x["suit"] = rand(1..4)
  #Generating Dealer's card
  y["value"] = rand(1..11)
  y["suit"] = rand(1..4)
  #Ensuring that dealer's card is not the same as the user's card
  while y["value"] == x["value"] && y["suit"] == x["suit"]
    y["value"] = rand(1..11)
    y["suit"] = rand(1..4)
  end
  puts "User: You have a #{x['value']} of the suit #{x['suit']}"
  puts "Dealer: You have a #{y['value']} of the suit #{y['suit']}"
  return x, y
end

def dealerlogic
  #Creates an array with two values: true and false. And randomly sends one of them back. 
  choice = [true, false] #probability = 50%. To make it bias, add true or false to taste.
  return choice.sample
end


puts "Come in, sit down. Have a cigar"
#Step 1: I dealt cards
puts "Dealing cards now"
user, dealer = deal #Reusable code Apply the function deal to two variables: user, dealer

usrtotal = user["value"]
dlrtotal = dealer["value"]


puts "----------------------------"

puts "Would you like to Hit(1) or Stay(2)?"
choice = gets.chomp() #User enters his choice here.

if choice == '1' #Hit
  puts "You choose to hit."

  dealer["choice"] = dealerlogic #Now dealer makes a decision based on cool AI method.
  if dealer["choice"] == true
    puts "Dealer chooses to hit."
    user, dealer = deal #Reusable code
    usrtotal += user["value"]
    dlrtotal += dealer["value"]
  else
    puts "Dealer chooses to stay."
    user = deal #Reusable code
    usrtotal += user.first["value"]
  end
  puts "User, your total currently is #{usrtotal}"
  puts "Dealer, your total currently is #{dlrtotal}"
  
  if usrtotal > dlrtotal
    puts "You win"
  elsif dlrtotal > usrtotal
    puts "Dealer wins"
  else
    puts "It's a draw"
  end

elsif choice =='2'
  #perform stay
  puts "You choose to stay. Your total currently is #{usrtotal}"
  dealer["choice"] = dealerlogic #again, call cool AI method
  if dealer["choice"] == true
    puts "Dealer chooses to hit."
    dealer = deal #Reusable code
    dlrtotal += dealer.first["value"]
  else
    puts "Dealer chooses to stay."
  end
  puts "Dealer total currently is #{dlrtotal}"
  if usrtotal > dlrtotal
    puts "You win"
  elsif dlrtotal > usrtotal
    puts "Dealer wins"
  else
    puts "It's a draw"
  end
else
  puts "witty idiot code goes here"
end