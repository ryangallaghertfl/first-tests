require 'string_builder'

RSpec.describe StringBuilder do
    it "creates a string builder object and returns length 5" do
        string_builder1 = StringBuilder.new
        string_builder1.add("hello")
        result = string_builder1.size
        expect(result).to eq 5
    end

    it "creates a string builder object, adds 2 strings returns Hello, hello." do
        string_builder2 = StringBuilder.new
        string_builder2.add("Hello, ")
        string_builder2.add("hello.")
        result = string_builder2.output
        expect(result).to eq "Hello, hello."
    end

    context "given one addition of a string" do
        it "outputs that string" do
            string_builder3 = StringBuilder.new
            string_builder3.add("hello")
            expect(string_builder3.output).to eq "hello"
        end

        it "has a size of that string's length" do
            string_builder3 = StringBuilder.new
            string_builder3.add("hello")
            expect(string_builder3.size).to eq 5
        end
    end 
end