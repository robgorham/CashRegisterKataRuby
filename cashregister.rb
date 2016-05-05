class Denom

	include Comparable

	@singular
	@plural
	@value
	#immutable class
	attr_reader :singular
	attr_reader :plural
	attr_reader :value

	def initialize(singular, plural, value)
		@singular = singular
		@plural = plural
		@value = value
	end

	def <=>(other)
		@value <=> other.value
	end
end

class Register
	@denomlist

	def initialize(denomlist = [])
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

	def GetChange(change)
		puts change
		result = ""
		count = Array.new(@denomlist.size) {0}
		while change > 0
			change = change.round(2)
			count[GreatestDenom(change)] += 1
			change -= @denomlist[GreatestDenom(change)].value
		end
		result += "Change Returned:\n"+ StringChange(count)
		
		result
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
		puts change
		result = ""
		count = Array.new(@denomlist.size) {0}
		grD = 0
		diff = 0
		while change > 0
			grD = GreatestDenom(change)
			diff = @denomlist.size - grD
			chosen = Random.rand(diff) + grD
			change = change.round(2)
			count[chosen] += 1
			change -= @denomlist[chosen].value
		end
		result += "Random Change Returned:\n" + StringChange(count)		
		result
	end

end

denomlist = [Denom.new("fifty","fifties",50), Denom.new("twenty","twenties",20), Denom.new("ten","tens",10), Denom.new("five","fives",5),
				Denom.new("one","ones",1), Denom.new("quarter","quarters",(0.25).round(2)), Denom.new("dime","dimes",0.1), Denom.new("penny","pennies",0.01), 
				Denom.new("nickel","nickels", 0.05), Denom.new("hundred","hundreds",100)]
regi = Register.new(denomlist)
puts regi.GetChange(478.56)
puts regi.GetRandomChange(478.56)
#puts regi.GetDenomListNames









