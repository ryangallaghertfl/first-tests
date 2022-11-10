require 'gratitudes'

RSpec.describe Gratitudes do
    it "creates an object which returns 4 reasons to be grateful" do
        cheerful = Gratitudes.new
        cheerful.add("food")
        cheerful.add("shelter")
        cheerful.add("friends")
        cheerful.add("knowledge")
        expect(cheerful.format).to eq "Be grateful for: food, shelter, friends, knowledge"
    end

    it "adds two blank strings, should be only a comma after Be grateful for: " do
        cheerful = Gratitudes.new
        cheerful.add("")
        cheerful.add("")
        expect(cheerful.format).to eq "Be grateful for: , "
    end
end