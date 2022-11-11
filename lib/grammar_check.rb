def grammar_check(string)
    name = string
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
            return true
        else
            return false
        end
end
