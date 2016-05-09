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