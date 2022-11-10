require "report_length"

RSpec.describe "report_length method" do 
    it "checks that it returns 6 char long" do
        result = report_length("horsey")
        expect(result).to eq "This string was 6 characters long."
    end

    it "checks that it returns 0 char long" do
        result = report_length("")
        expect(result).to eq "This string was 0 characters long."
    end

    it "checks that it returns 1 char long" do
        result = report_length("delicious")
        expect(result).to eq "This string was 9 characters long."
    end


end
