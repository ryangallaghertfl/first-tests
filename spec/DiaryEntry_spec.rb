require "DiaryEntry"

=begin
{{PROBLEM}} Method Design Recipe

1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.
- DiaryEntry Class
- initialize - with title and contents arguments as strings - stored as 
    instance variables
- title method - returns title as a string
- contents method - returns contents as a string
- count_words method - returns number of words in contents as integer
- reading_time method - accepts words per minute (WPM) as argument, 
    returns estimate of reading time of contents as integer
- reading_chunk - accepts WPM and minutes as arguments. Returns a string with
   chunk of content that user can read in given number of minutes. If called again
   it will skip what has already been read until contents is fully read. If called
   again it will restart from beginning.

2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

'''ruby my_diary = DiaryEntry.new(title, contents)
  - title is a string
  - contents is a string


3. Create Examples as Tests

Make a list of examples of what the method will take and return.

'''ruby

#1 my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
puts my_diary.title
=> "Tuesday 15 November 2022"
puts my_diary.contents
=> "Today I am working on Section 5 of Phase 2"

#2 #1 my_diary = DiaryEntry.new("Monday 2 Janury 2023", "Turns out the 
   plot of the movie 'The Terminator' has come true. I can't believe the cranks 
   online were right about robots rising up to enslave us. I write this from 
   an underground bunker with only rats for company as nuclear detonations 
   destroy the infrastructure above!")
puts my_diary.title
=> "Monday 2 January 2023"
puts my_diary.contents
=> "Turns out the plot of the movie 'The Terminator' has come true. I can't 
    believe the cranks online were right about robots rising up to enslave us. 
    I write this from an underground bunker with only rats for company as nuclear 
    detonations destroy the infrastructure above!"
puts my_diary.count
=> 46
puts my_diary.reading_time(30)
=> 2
puts my_diary.reading_chunk(30, 1)
=> "You were able to read: Turns out the plot of the movie 'The Terminator' has come true. I can't 
    believe the cranks online were right about robots rising up to enslave us. 
    I write this..."
puts my_diary.reading_chunk(30, 1)
=> "You were able to read: from an underground bunker with only rats for company as nuclear 
    detonations destroy the infrastructure above! END OF CONTENTS"
puts my_diary.reading_chunk(20, 2)
=> "You were able to read: Turns out the plot of the movie 'The Terminator' has come true. I can't 
    believe the cranks online were right about robots rising up to enslave us. 
    I write this from an underground bunker with only rats for company as..."



Encode each example as a test. Youo can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement behaviour.
=end

RSpec.describe DiaryEntry do
    it "adds a title and diary entry, returns title as string" do
        my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
        expect(my_diary.title).to eq "Tuesday 15 November 2022"
    end

    it "adds a title and diary entry, returns diary entry as string" do
        my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
        expect(my_diary.contents).to eq "Today I am working on Section 5 of Phase 2"
    end

    describe "#count_words" do
    it "counts the words in the contents" do
        my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
        expect(my_diary.count_words).to eq 10
        end
    end

    describe "#reading_time" do
    it "returns the reading time for the contents from a given words-per-minute, returns 2" do
        my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
        expect(my_diary.reading_time(9)).to eq 2
        end
    end

    it "returns the reading time for the contents from a given words-per-minute, returns 1" do
        my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
            expect(my_diary.reading_time(50)).to eq 1
        end

    context "a given words-per-minute of zero" do
        it "fails" do
            my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
            expect{ my_diary.reading_time(0) }.to raise_error "Reading speed should be above zero."
            end
        end
    
    

    describe "#reading_chunk" do
    context "with a text readable within given minutes" do
        it "returns the full contents" do
            my_diary = DiaryEntry.new("Tuesday 15 November 2022", "Today I am working on Section 5 of Phase 2")
            result = my_diary.reading_chunk(200, 1)
            expect(result). to eq "Today I am working on Section 5 of Phase 2"
        end 
    end 

    context "with contents unable to be read during the time" do
        it "returns the full contents" do
            my_diary = DiaryEntry.new("Monday 14 November 2022", "hello world everyone")
            result = my_diary.reading_chunk(2, 1)
            expect(result). to eq "hello world"
        end

        it "returns the next chunk next time it is called" do
            my_diary = DiaryEntry.new("Monday 14 November 2022", "hello world everyone")
            my_diary.reading_chunk(2, 1)
            result = my_diary.reading_chunk(2, 1)
            expect(result). to eq "everyone"
        end    

        it "restarts after reading whole contents" do
            my_diary = DiaryEntry.new("Monday 14 November 2022", "hello world everyone")
            my_diary.reading_chunk(2, 1)
            my_diary.reading_chunk(2, 1)
            result = my_diary.reading_chunk(2, 1)
            expect(result). to eq "hello world"
        end    
        it "restarts if it finishes exactly on the end" do
        my_diary = DiaryEntry.new("Monday 14 November 2022", "hello world everyone")
        my_diary.reading_chunk(2, 1)
        my_diary.reading_chunk(1, 1)
        result = my_diary.reading_chunk(2, 1)
        expect(result). to eq "hello world"
        end
    end
end
end
