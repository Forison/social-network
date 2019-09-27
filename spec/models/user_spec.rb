require "rails_helper"

RSpec.describe User, type: :model do
  describe "Test User model validation" do
    it "create new user" do
      new_user = create(:user, lastname: "ama", firstname: "addo", dob: "1/1/1999", gender: "female", email: "ama@gmail.com", password: "qwertyuiop", password_confirmation: "qwertyuiop")
      expect(new_user).to be_valid
    end

    it "Is invalid if lastname is nil/empty" do
      nil_lastname = build(:user, lastname: "")
      expect(nil_lastname).not_to be_valid
    end

    it "Is invalid if firstname is nil/empty" do
      nil_firstname = build(:user, firstname: "")
      expect(nil_firstname).not_to be_valid
    end

    it "Is invalid if email is nil/empty" do
      nil_email = build(:user, email: "")
      expect(nil_email).not_to be_valid
    end

    it "Is invalid if dob is nil/empty" do
      nil_dob = build(:user, dob: "")
      expect(nil_dob).not_to be_valid
    end

    it "Is invalid if gender is nil/empty" do
      nil_gender = build(:user, gender: "")
      expect(nil_gender).not_to be_valid
    end

    it "Is invalid if password is nil/empty" do
      nil_password = build(:user, password: "")
      expect(nil_password).not_to be_valid
    end

    it "Is invalid if password_confirmation is nil/empty" do
      nil_password_confirmation = build(:user, password_confirmation: "")
      expect(nil_password_confirmation).not_to be_valid
    end

    it "password and password confirmation must match " do
      user = create(:user)
      expect(user.password).to eql(user.password_confirmation)
    end
  end
end
