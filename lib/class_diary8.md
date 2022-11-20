# 1
diary = Diary.new
entry = DiaryEntry.new("today", "the first entry in my diary")
diary

#
#
#
#
#
#
#

# Original Version

# def get_most_common_letter(text)
#     counter = Hash.new(0)
#     GSUB
# text.chars.each do |char|
#       counter[char] += 1
#     end
#     counter.to_a.sort_by { |k, v| v }[0][0]
#   end
  
  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"
  