class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @chunk_read = 0
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
        return words.length
    end
  
    def reading_time(wpm) 
        fail "Reading speed should be above zero." unless wpm > 0
        return (count_words / wpm.to_f).ceil
        # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
    end
  
    def reading_chunk(wpm, minutes) 
        fail "Reading speed should be above zero." unless wpm > 0
        num_words_read = wpm * minutes
        start_from = @chunk_read
        end_at = @chunk_read + num_words_read
        word_list = words[start_from, end_at]
        if end_at >= count_words
            @chunk_read = 0
        else
            @chunk_read = end_at
        end
        return word_list.join(" ")
    # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end

    private
    def words
        return @contents.split(/ /)
    end
  end