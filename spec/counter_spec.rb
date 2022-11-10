require 'counter'

RSpec.describe Counter do
    it "creates a counter and then increments by 5" do
        counter = Counter.new
        counter.add(5)
        result = counter.report
        expect(result).to eq "Counted to 5 so far."
    end

    it "creates a counter and then increments by 10" do
        counter2 = Counter.new
        counter2.add(10)
        result = counter2.report
        expect(result).to eq "Counted to 10 so far."
    end

    it "creates a counter and then increments by -1" do
        counter3 = Counter.new
        counter3.add(-1)
        result = counter3.report
        expect(result).to eq "Counted to -1 so far."
    end

    it "creates a counter and reports zero count" do
        counter4 = Counter.new
        expect(counter4.report).to eq "Counted to 0 so far."
    end
end

