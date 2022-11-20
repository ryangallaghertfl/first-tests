  # File: lib/todo.rb
  class Todo
    def initialize(task) # task is a string
      @this_task = task
      @is_done = false
    end
  
    def task
      @this_task
    end
  
    def mark_done!
        @is_done = true
      # Marks the todo as done
      # Returns nothing
    end
  
    def done?
        return @is_done
      # Returns true if the task is done
      # Otherwise, false
    end
  end