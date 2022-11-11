require "grammar_check"

# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

# As a user
# So that I can improve my grammar
# I want to verify that a text starts with a capital letter and ends with a suitable 
# sentence-ending punctuation mark.
## 2. Design the Method Signature

#_Include the name of the method, its parameters, return value, and side effects._

# ```ruby
# # EXAMPLE

# # grammar_check takes a parameter text which will check the text to see if it
# passes correct grammar requirements
# - starts with capital letter
# - ends with suitable sentence-ending punctuation: (! . ?)
# Returns a boolean value if the sentence passes


## 3. Create Examples as Tests


# grammar_check("hello my name is Caroline") => false
# grammar_check("I am not Caroline.") => true
# grammar_check("") => false
# grammar_check("i am not Caroline.") => false
# ```

# ```ruby
# EXAMPLE

## 4. Implement the Behaviour

# _After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
# ```

# RSpec.describe "grammar_check method" do
#     it "receives a string as a parameter and will return true if it is a string" do
#         result = grammar_check("Caroline")
#         expect(result.is_a? String).to eq true
#     end

#     it "receives string and first letter is capitalised will return true" do
#         expect(grammar_check("Caroline").start_with?(/[A-Z]/)).to eq true
#     end

#     it "receives string and first letter is not capitalised will return false" do
#         expect(grammar_check("caroline").start_with?(/[A-Z]/)).to eq false
#     end
RSpec.describe "grammar_check method" do
    it "receives string and last character has suitable punctuation, will return true" do
        name = "Caroline."
        lastletter = name[-1]
        if lastletter.include?("!") ||
            lastletter.include?("?") ||
            lastletter.include?(".")
            result = true
        else
            result = false
        end
        expect(result).to eq true
    end

    it "receives string and last character has no suitable punctuation, will return false" do
        name = "Caroline"
        lastletter = name[-1]
        if lastletter.include?("!") ||
            lastletter.include?("?") ||
            lastletter.include?(".") 
            result = true
        else
            result = false
        end
        expect(result).to eq false
    end

    it "receives string, returns true if first letter is capitalised and last letter is punctuated" do
        name = "Hello Caroline."
        lastletter = name[-1]
        if lastletter.include?("!") ||
            lastletter.include?("?") ||
            lastletter.include?(".") 
            result1 = true
        else
            result1 = false
        end

        result2 = name.start_with?(/[A-Z]/)
        if result1 && result2 
            finalresult = true
        else
            finalresult = false
        end
        expect(finalresult).to eq true
    end

    it "receives string, returns false as first letter is capitalised and last letter is not punctuated" do
        name = "Hello Caroline"
        lastletter = name[-1]
        if lastletter.include?("!") ||
            lastletter.include?("?") ||
            lastletter.include?(".") 
            result1 = true
        else
            result1 = false
        end

        result2 = name.start_with?(/[A-Z]/)
        if result1 && result2 
            finalresult = true
        else
            finalresult = false
        end
        expect(finalresult).to eq false
    end

    it "receives string, returns false as first letter is capitalised and punctuation in middle, not at end" do
        name = "Hello.Caroline"
        lastletter = name[-1]
        if lastletter.include?("!") ||
            lastletter.include?("?") ||
            lastletter.include?(".") 
            result1 = true
        else
            result1 = false
        end

        result2 = name.start_with?(/[A-Z]/)
        if result1 && result2 
            finalresult = true
        else
            finalresult = false
        end
        expect(finalresult).to eq false
    end

    it "receives string, returns false as first letter is not capitalised and punctuation is at end" do
        name = "hello Caroline."
        lastletter = name[-1]
        if lastletter.include?("!") ||
            lastletter.include?("?") ||
            lastletter.include?(".") 
            result1 = true
        else
            result1 = false
        end

        result2 = name.start_with?(/[A-Z]/)
        if result1 && result2 
            finalresult = true
        else
            finalresult = false
        end
        expect(finalresult).to eq false
    end

it "receives string, returns true as first letter capitalised, final character is punctuation" do
    expect(grammar_check("Caroline.")).to eq true
end

it "receives string, returns false as first letter capitalised, final character is not punctuation" do
    expect(grammar_check("Caroline")).to eq false
end

it "receives string, returns false as first letter not capitalised, final character is punctuation" do
    expect(grammar_check("caroline.")).to eq false
end

it "receives string, returns false as first letter capitalised, punctuation in middle, not end" do
    expect(grammar_check("Caro?line")).to eq false
end

end