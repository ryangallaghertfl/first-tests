require "password_checker"

RSpec.describe PasswordChecker do
    it "should return true as password is 9 characters long" do
        lovely_Ira = PasswordChecker.new
        expect(lovely_Ira.check("Dexterdog")).to eq true
    end

    it "should return error because password under 8 chars" do
        lovely_Ira = PasswordChecker.new
        expect {lovely_Ira.check("Dexter")}.to raise_error "Invalid password, must be 8+ characters."
    end

end
