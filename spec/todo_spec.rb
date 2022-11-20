require "todo"

RSpec.describe Todo do
    it "constructs" do
        what_a_todo = Todo.new("argue with people on the internet")
        expect(what_a_todo.task).to eq "argue with people on the internet"
        expect(what_a_todo.done?).to eq false
    end

    describe "#mark_done!" do
        it "should change the the task to done" do
            what_a_todo = Todo.new("argue with people on the internet")
            what_a_todo.mark_done!
            expect(what_a_todo.done?).to eq true
        end
    end
end
