
class GrammarStats
    def initialize
      @counter = 0
      @success = 0
    end
  
    def check(text) # text is a string
      @counter = @counter + 1
      p "counter is: #{@counter}"
      p "success is: #{@success}"
      if (text.end_with?("!") || text.end_with?("?") || text.end_with?("."))
        if text.start_with?(/[A-Z]/)
          @success = @success + 1
          p "success is: #{@success}"
          return true
        end
      else
        p "counter is: #{@counter}"
        p "success is: #{@success}"
        return false
      end

    end
  
    def percentage_good
        calculation = (@success.to_f / @counter.to_f) * 100
        calculation =  calculation.round
        return calculation.to_i

    
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    end
  end
