require './lib/denom'

class Register
	@denomlist

	def initialize(denomlist = [Denom.new("fifty","fifties",50),Denom.new("twenty","twenties",20), Denom.new("ten","tens",10), Denom.new("five","fives",5),
				Denom.new("one","ones",1), Denom.new("quarter","quarters",(0.25).round(2)), Denom.new("dime","dimes",0.1), Denom.new("penny","pennies",0.01), 
				Denom.new("nickel","nickels", 0.05)])
		@denomlist = denomlist
		if @denomlist != []
			@denomlist.sort!.reverse!
		end
	end

	def AddDenom(denom)
		@denomlist << denom
	end

	def GreatestDenom(val)
		(0...@denomlist.size).each do |inc|
			if val >= @denomlist[inc].value
				return inc
			end
		end
		return -1
	end

	def GetGreatestDenom(val)
		@denomlist[GreatestDenom(val)]
	end



=begin	def GetChangeArray(change)
		count = Array.new(@denomlist.size) {0}
		while change > 0
			grD = GreatestDenom(change)
			change = change.round(2)
			count[grD] += 1
			change -= @denomlist[grD].value
		end
		count
	end
=end

	def GetChange(change)
		result = change.to_s
		count = Array.new(@denomlist.size) {0}
		while change > 0
			grD = GreatestDenom(change)
			change = change.round(2)
			count[grD] += 1
			change -= @denomlist[grD].value
		end

		"#{result}\nChange Returned:\n"+ StringChange(count)
	end

	def StringChange(count)
		result = ""
		(0...@denomlist.size).each do |inc|
			if count[inc] > 1
				result +=  "#{count[inc]} #{@denomlist[inc].plural}\n"
			elsif count[inc] == 1
				result += "#{count[inc]} #{@denomlist[inc].singular}\n"				
			end
		end
		result
	end

	def GetRandomChange(change)
		result = change.to_s
		count = Array.new(@denomlist.size) {0}
		grD = 0
		diff = 0
		while change > 0
			grD = GreatestDenom(change) #id in @denomlist of Greatest Denom under change
			diff = @denomlist.size - grD
			chosen = Random.rand(diff) + grD
			change = change.round(2)
			count[chosen] += 1
			change -= @denomlist[chosen].value
		end

		"#{result}\nRandom Change Returned:\n" + StringChange(count)
	end

end