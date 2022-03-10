require 'rails_helper'

RSpec.describe Reader, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comments) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:reader_name) }

    end
end
