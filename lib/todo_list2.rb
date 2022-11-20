
class TodoList2
    def initialize
        @task_array = []
    end
  
    def add(todo) # todo is an instance of Todo
        @task_array << todo
        

      # Returns nothing
    end
  
    def incomplete
        inc_list = []
        @task_array.each { | todo | inc_list << todo.task unless todo.done? == true}
        return inc_list
    end
  
    def complete
        comp_list = []
        @task_array.each do |task|
            if task.done?
                comp_list << task.task
            end
        end
        return comp_list
    end
  
    def give_up!
        @task_array.each do |task|
            task.mark_done!
        end
    end
  end

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

#   newlist = TodoList.new
#   newtask = Todo.new("Argue with people on the internet")
#   newtask2 = Todo.new("Reply to emails")
#   newtask3 = Todo.new("Look at the weather")
#   newlist.add(newtask)
#   newlist.add(newtask2)
#   newlist.add(newtask3)
#   puts "incomplete:" 
#   puts newlist.incomplete
#   newlist.give_up!
#   puts "complete:"
#   puts newlist.complete