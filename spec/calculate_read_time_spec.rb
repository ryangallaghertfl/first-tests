require "calculate_read_time"

RSpec.describe "calculate_read_time method" do
    it "returns zero because string is empty" do
        result = calculate_read_time("")
        expect(result).to eq 0
    end

    it "returns 1 because text is under 200 words" do
        result = calculate_read_time("Ashes to Ashes")
        expect(result).to eq 1
    end

    it "returns 1 because text is 200 words" do
        result = calculate_read_time("Heroes" * 200)
        expect(result).to eq 1
    end

    it "returns 2 because text is 300 words" do
        result = calculate_read_time("Ashes to Ashes" * 100)
        expect(result).to eq 2
    end

end