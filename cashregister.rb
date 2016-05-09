require './register'

test = 179.57

denomlist = [Denom.new("fifty","fifties",50), Denom.new("twenty","twenties",20), Denom.new("ten","tens",10), Denom.new("five","fives",5),
				Denom.new("one","ones",1), Denom.new("quarter","quarters",(0.25).round(2)), Denom.new("dime","dimes",0.1), Denom.new("penny","pennies",0.01), 
				Denom.new("nickel","nickels", 0.05), Denom.new("hundred","hundreds",100)]
regi = Register.new(denomlist)
puts regi.GetChange(test) + "\n"
puts regi.GetRandomChange(test)
#puts regi.GetDenomListNames









