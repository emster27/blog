require "rails_helper"

RSpec.describe Page, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:profile) }

    it { should have_many(:bookmarks) }

    it { should have_many(:analytics) }

    it { should have_many(:comments) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
