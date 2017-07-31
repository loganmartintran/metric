require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@user.com", password: "password") }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@user.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have email and password attributes" do
      expect(user).to have_attributes(email: "user@user.com", password: "password")
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_email) { User.new(email: "", password: "password") }

    it "should be invalid due to a bank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end

end
