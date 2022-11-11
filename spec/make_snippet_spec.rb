# A method called make_snippet that takes a string as an argument and returns the first five words 
#   and then a '...' if there are more than that.

require "make_snippet"

#my first test - I plan to just return a simple string, return it and write the code to pass
RSpec.describe "make_snippet method" do
    it "takes a string as an argument and returns it" do
         result = make_snippet("hello")
         expect(result.is_a? String).to eq true
    end
#my second test - I plan to return an array of words from the string argument
# commented out as no longer needed
# it "takes a string as an argument, converts to array of words" do
#     result = make_snippet("hello my name is Ryan Gallagher")
#     expect(result.kind_of?(Array)).to eq true
# end

# #my third test - I plan to return an array of first 5 entries
# commented out as no longer needed
# it "takes string as arg, converts to array, returns array of first 5 entries" do
#     result = make_snippet("hello my name is Ryan Gallagher") 
#     expect(result.length).to eq 5
# end

#my fourth test - I plan to convert an array of first 5 entries back to string
it "takes a string, converts to array, then back to a string" do
    result = make_snippet("hello my name is Ryan Gallagher")
    expect(result.is_a? String).to eq true
end

#fifth test - return string of first 6 words with ... at the end
it "returns first 5 words as string with... at the end" do
    result = make_snippet("hello there my name is Ryan Gallagher")
    expect(result).to eq "hello there my name is..."
end

#sixth test - if string less than 6 words, just return that string
it "returns string without modification when 5 words" do
    result = make_snippet("my name is Ryan Gallagher")
    expect(result).to eq "my name is Ryan Gallagher"
end

#seventh test - if string 10 words, then return first 5 words with ... at end
it "returns first 6 words of 10-word string with ... at the end" do
    result = make_snippet("I am Ryan and I am doing test-driven development")
    expect(result).to eq "I am Ryan and I..."
end


end

