require "class_diary_entry8"

RSpec.describe SingleDiaryEntry do
    it "constructs" do
        diary_entry = SingleDiaryEntry.new("this_title", "this_contents")
        expect(diary_entry.title).to eq "this_title"
        expect(diary_entry.contents).to eq "this_contents"
    end

    describe "#count_words" do
        it "counts the words in the contents" do
        diary_entry = SingleDiaryEntry.new("this_title", "one two three four")
        expect(diary_entry.count_words).to eq 4
    end

    it "counts the words in empty string, return 0" do
        diary_entry = SingleDiaryEntry.new("this_title", "")
        expect(diary_entry.count_words).to eq 0
    end
end

    describe "#reading_time" do
        it "fails if wpm is zero" do
            diary_entry = SingleDiaryEntry.new("this_title", "one two three four")
            expect{diary_entry.reading_time(0)}.to raise_error "WPM must be positive."
        end



        it "returns 2 on 4-word string as reads 2 words per minute" do
        diary_entry = SingleDiaryEntry.new("this_title", "one two three four")
        expect(diary_entry.reading_time(2)).to eq 2
    end

    it "returns 3 as reads 2 words per minute on 5 word string" do
        diary_entry = SingleDiaryEntry.new("this_title", "one two three four five")
        expect(diary_entry.reading_time(2)).to eq 3
    end

    it "returns 1 as 1-word string can be read in 1 minute" do
        diary_entry = SingleDiaryEntry.new("this_title", "one")
        expect(diary_entry.reading_time(2)).to eq 1
    end

    it "return 0, as no string to read" do
        diary_entry = SingleDiaryEntry.new("this_title", "")
        expect(diary_entry.reading_time(2)).to eq 0
    end
end

end