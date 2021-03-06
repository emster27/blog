require "rails_helper"

RSpec.describe Analytic, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:page) }
  end

  describe "InDirect Associations" do
    it { should have_one(:bookmark) }
  end

  describe "Validations" do
    it { should validate_presence_of(:page_id) }

    it { should validate_presence_of(:reader_id) }
  end
end
