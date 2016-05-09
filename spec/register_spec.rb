require './lib/register'

describe "Register" do 

	describe "Instantiation" do
		context "Instance w params " do
			it "GetGreatestDenom(.02).value == .01" do
				r = Register.new([Denom.new("penny","pennies",0.01)])
				d = r.GetGreatestDenom(0.02).value
				expect(d).to eql(0.01)
			end
		end
	end

	describe "sanity check" do
		it "returns true == true" do
			expect(true)
		end
	end
end