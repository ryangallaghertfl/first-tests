def calculate_read_time(text)
    if text.empty?
        return 0
    else
        words = text.split(" ")
        return (words.length / 200.to_f).ceil
    end
end
