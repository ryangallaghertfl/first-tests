# File: lib/gratitudes.rb

class Gratitudes
    def initialize
      @gratitudes = []
    end
  
    def add(gratitude)
      @gratitudes.push(gratitude)
    end
  
    def format
      formatted = "Be grateful for: "
      formatted += @gratitudes.join(", ")
      return formatted
    end
  end

  cheerful = Gratitudes.new
  cheerful.add("food")
  cheerful.add("shelter")
  cheerful.add("friends")
  cheerful.add("knowledge")
  puts cheerful.format