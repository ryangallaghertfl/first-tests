def get_most_common_letter(text)
    counter = Hash.new(0)
    #p "counter is: #{counter}"
    textcommon = text.gsub(" ", "")     # program is counting whitespace as a letter, so remove whitespace
    textcommon.chars.each do |char|
      #p "counter is: #{counter} at this stage of loop:"
      #p "char is: #{char}"
      #p "counter[char] is: #{counter[char]} before increment"
      counter[char] += 1
     # p "counter[char] is: #{counter[char]} after increment"
    end
    # p counter.sort_by{|k,v| v}.reverse #I've realised it is taking the lowest value, not the highest
    counter.to_a.sort_by { |k, v| v }.reverse[0][0]
  end
  
  # Intended output:
  # 
  p get_most_common_letter("the roof, the roof, the roof is on fire!")
  p "should be=> o"
  
  p get_most_common_letter("Ryan Gallagher")
  p "should be=> a"


# Original Version

# def get_most_common_letter(text)
#     counter = Hash.new(0)
#     text.chars.each do |char|
#       counter[char] += 1
#     end
#     counter.to_a.sort_by { |k, v| v }[0][0]
#   end
  
  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"
  