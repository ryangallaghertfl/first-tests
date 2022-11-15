require "GrammarStats"

=begin
{{PROBLEM}} Method Design Recipe

1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.
- GrammarStats Class
- initialize - no parameters

2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

grammarstats = GrammarStats.new

grammarstats.new(text) - arg is a string
- returns boolean depending on whether text begins with capital letter
   and ends with sentence-ending punctuation mark

grammarstats.percentage_good - no arg
- returns an interger, the percentage of texts checked so far that
   passed the check defined in check method. 55 represents 55%

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

'''ruby

#1 grammarstats = GrammarStats.new
=> {04595e0d34ff} or some hex number
grammarstats.check("Hello world!")
=> true
puts grammarstats.percentage_good
=> 100
grammarstats.check("Hello world.")
=> true
grammarstats.check("Hello world,")
=> false
puts grammarstats.percentage_good
=> 67
grammarstats.check("hello world!")
=> false
puts grammarstats.percentage_good
=> 50
grammarstats.check("!Hello world")
=> false
puts grammarstats.percentage_good
=> 40
grammarstats.check("!Hello world!")
=> false
puts grammarstats.percentage_good
=> 33




Encode each example as a test. Youo can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement behaviour.
=end

RSpec.describe GrammarStats do
    
    describe "#check method" do
    it "returns true string with capital first letter and sentence-ending !" do
    grammarstats = GrammarStats.new
    expect(grammarstats.check("Hello world!")).to eq true
    end

    it "returns false string with capital first letter and sentence-ending '.'" do
        grammarstats = GrammarStats.new
        expect(grammarstats.check("Hello world.")).to eq true
    end

    it "returns false string with capital first letter and sentence-ending ','" do
        grammarstats = GrammarStats.new
        expect(grammarstats.check("Hello world,")).to eq false
    end
end

     describe "#percentage_good method" do
    it "checks 3 texts, two pass true - returns 67 percentage passed" do
       grammarstats = GrammarStats.new
       grammarstats.check("Hello world!")
       grammarstats.check("Hello world.")
       grammarstats.check("Hello world,")
       result = grammarstats.percentage_good
       expect(result).to eq 67
    end

    it "checks 4 texts, three pass true - returns 75 percentage pass" do
        grammarstats = GrammarStats.new
        grammarstats.check("Hello world!")
        grammarstats.check("Hello world.")
        grammarstats.check("Hello world?")
        grammarstats.check("Hello world,")
        result = grammarstats.percentage_good
        expect(result).to eq 75
     end

     it "checks 5 texts, two pass true - returns 40 percentage pass" do
        grammarstats = GrammarStats.new
        grammarstats.check("Hello world!")
        grammarstats.check("Hello world.")
        grammarstats.check("Hello world")
        grammarstats.check("Hello world,")
        grammarstats.check("hello world!")
        result = grammarstats.percentage_good
        expect(result).to eq 40
     end

end 
end
