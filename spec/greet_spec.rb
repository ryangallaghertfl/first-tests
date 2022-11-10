require "greet"

RSpec.describe "greet method" do 
    it "greet a given user" do
        result = greet("Ryan")
        expect(result).to eq "Hello, Ryan!"
    end
end