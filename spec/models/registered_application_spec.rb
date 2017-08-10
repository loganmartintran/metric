require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { User.create!(email: 'user@user.com', password: 'password') }
  let(:app) { RegisteredApplication.create!(name: 'app', url: 'app@app.com', user: user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:user) }

  describe "attributes" do
    it "should have name, url, and user attributes" do
      expect(app).to have_attributes(name: 'app', url: 'app@app.com', user: user)
    end
  end
end
