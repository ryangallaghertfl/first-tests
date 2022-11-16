class TodoList
    def initialize
        @tasks = []
    end

    def list
        return @tasks
    end

    def complete(task)
        fail "No such task." unless @tasks.include? task
        @tasks.delete(task)
    end

    def add(task)
        @tasks << task
    end
end
