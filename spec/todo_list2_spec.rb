require 'todo_list2'
require 'todo'

RSpec.describe TodoList2 do
    it "adds a todo to a list and shows incomplete" do
        newlist = TodoList2.new
        newtask = Todo.new("Argue with people on the internet")
        newlist.add(newtask)
        expect(newlist.incomplete).to eq ["Argue with people on the internet"]
    end

    it "adds two todo - to list and shows incomplete" do
        newlist = TodoList2.new
        newtask = Todo.new("Argue with people on the internet")
        newtask2 = Todo.new("Reply to emails")
        newlist.add(newtask)
        newlist.add(newtask2)
        expect(newlist.incomplete).to eq ["Argue with people on the internet", "Reply to emails"]
    end

    it "adds three todo - calls give_up method, outputs empty incomplete list" do
        newlist = TodoList2.new
        newtask = Todo.new("Argue with people on the internet")
        newtask2 = Todo.new("Reply to emails")
        newtask3 = Todo.new("Look at the weather")
        newlist.add(newtask)
        newlist.add(newtask2)
        newlist.add(newtask3)
        newlist.give_up!
        expect(newlist.incomplete).to eq []
    end

    it "adds three todo - calls give_up method, outputs all entries in complete list" do
        newlist = TodoList2.new
        newtask = Todo.new("Argue with people on the internet")
        newtask2 = Todo.new("Reply to emails")
        newtask3 = Todo.new("Look at the weather")
        newlist.add(newtask)
        newlist.add(newtask2)
        newlist.add(newtask3)
        newlist.give_up!
        expect(newlist.incomplete).to eq []
    end
    
end
