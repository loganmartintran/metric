require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create!(email:'user@user.com', password:'password') }
  let(:app) { RegisteredApplication.create!(name:'app', url:'app@app.com', user: user) }
  let(:event) { Event.create!(name:'event', registered_application: app) }

  describe "attributes" do
    it "should have name and registered_application attributes" do
      expect(event).to have_attributes(name:'event', registered_application: app)
    end

    it "should respond to name attribute" do
      expect(event).to respond_to(:name)
    end

    it "should respond to registered_application attribute" do
      expect(event).to respond_to(:registered_application)
    end
  end
end
