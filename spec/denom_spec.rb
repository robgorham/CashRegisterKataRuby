require './lib/denom'


describe "Denom" do

	describe ".singular" do
		context "given installed twenties denom" do
			it "returns twenty" do
				d = Denom.new("Twenty", "Twenties", 20)
				result = d.singular
				expect(result).to eql("Twenty")
			end
		end
	end


	describe ".plural" do
		context "given installed twenties denom" do
			it "returns twenties" do
				d = Denom.new("Twenty", "Twenties", 20)
				result = d.plural
				expect(result).to eql("Twenties")
			end
		end
	end

	describe ".value" do
		context "given installed twenties denom" do
			it "returns 20" do
				d = Denom.new("Twenty","Twenties",20)
				result = d.value.to_s
				expect(result).to eql("20")
			end
		end
	end

	describe "<=>" do
		context "Comparing Twenty and Ten Denoms" do
			it "returns True" do
			 	tw = Denom.new("Twenty","Twenties",20)
			 	tens = Denom.new("Ten","Tens",10)
			 	result = (tw > tens)
			 	expect(result).to eql(true)
			 end
		end
	end 


	context "return true always" do
		it "returns true = true" do
			true == true
		end
	end

end