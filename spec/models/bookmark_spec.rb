require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:reader) }

    it { should belong_to(:page) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
