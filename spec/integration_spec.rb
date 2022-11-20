require "class_diary_8"
require "class_diary_entry8"

RSpec.describe "integration" do
    it "lists out the diaries added" do
        diary = Diary.new
        diary_entry_1 = SingleDiaryEntry.new("my_title", "my_contents")
        diary_entry_2 = SingleDiaryEntry.new("my_title 2", "my_contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end

    describe "counting words behaviour" do
        it "counts the number of words in all diary entries" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my_title", "my contents")
            diary_entry_2 = SingleDiaryEntry.new("my_title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.count_words).to eq 5
        end
    end

    describe "reading time behaviour" do
        it "fails where wpm is 0" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my title", "my contents 1")
            diary.add(diary_entry_1)
            expect{diary.reading_time(0)}.to raise_error("WPM must be positive.")
        end


        it "calculates the reading time for all entries where it matches exact" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my_title", "my contents 1")
            diary_entry_2 = SingleDiaryEntry.new("my_title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end

        it "calculates the reading time for all entries where it falls over a minute" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my_title", "my contents")
            diary_entry_2 = SingleDiaryEntry.new("my_title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end
    end

    describe "best reading time entry behaviour" do
        it "fails where wpm is 0" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my_title", "my contents much longer")
            diary.add(diary_entry_1)   
            expect { diary.find_best_entry_for_reading_time(0,1)}.to raise_error "WPM must be positive."
        end



        context "where we have one entry and it is readable in the time" do
        it "returns that entry" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my_title", "my contents")
            diary.add(diary_entry_1)   
            result = diary.find_best_entry_for_reading_time(2,1)
            expect(result).to eq diary_entry_1
        end
    end

    context "we have 1 entry unreadable in the time" do
        it "returns nil" do
            diary = Diary.new
            diary_entry_1 = SingleDiaryEntry.new("my_title", "my contents much longer")
            diary.add(diary_entry_1)   
            result = diary.find_best_entry_for_reading_time(2,1)
            expect(result).to eq nil
        end
    end

    context "where we have multiple entries" do
        it "returns the longest entry the user could read in this time" do
            diary = Diary.new
            best_entry = DiaryEntry.new("my_title", "one two")
            diary.add(diary_entry_1 = SingleDiaryEntry.new("my_title", "one")) 
            diary.add(best_entry)   
            diary.add(diary_entry_1 = SingleDiaryEntry.new("my_title", "one two three"))   
            diary.add(diary_entry_1 = SingleDiaryEntry.new("my_title", "one two three four"))     
            result = diary.find_best_entry_for_reading_time(2,1)
            expect(result).to eq best_entry
            
        end 
    end


    end

end