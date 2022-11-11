# A method called count_words that takes a string as an argument and returns the number of words in that string.

require "count_words"

#test 1 - take a string as argument, returns string
# RSpec.describe "count_words method" do
# commented out as no longer needed
#     it "takes a string as an argument and returns it" do
#          result = count_words("hello")
#          expect(result.is_a? String).to eq true
#     end

# #test 2 - take string as arg, convert to array
# it "takes string as arg, converts to an array" do
#     result = count_words("hello my name is Ryan")
#     expect(result.kind_of?(Array)).to eq true
# end

#test 3 - counts the size of array once converted from string
RSpec.describe "count_words method" do
  it "takes 5-word string as arg, converts to array, count size of array return 5" do
  result = count_words("hello my name is Ryan")
  expect(result).to eq 5
  end

  it "takes empty string as arg, counts number of words returns 0" do
    result = count_words("")
    expect(result).to eq 0
    end
    
  it "takes 6-word string as arg, counts number of words returns 6" do
    result = count_words("hello my name is Ryan Gallagher")
    expect(result).to eq 6
    end

  it "takes 1-word string as arg, converts to array, counts number of words returns 1" do
    result = count_words("Ryan")
    expect(result).to eq 1
    end
end