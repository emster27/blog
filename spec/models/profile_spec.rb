require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "Direct Associations" do
    it { should have_many(:social_links) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:password) }
  end
end
