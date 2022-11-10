require "check_codeword"

RSpec.describe "check_codeword method" do 
    it "checks that it returns correct" do
        result = check_codeword("horse")
        expect(result).to eq "Correct! Come in."
    end

    it "checks that it returns wrong codeword" do
        result = check_codeword("carriage")
        expect(result).to eq "WRONG!"
    end

    it "checks that the answer is close, but wrong" do
        result = check_codeword("horsie")
        expect(result).to eq "Close, but nope."
    end
end