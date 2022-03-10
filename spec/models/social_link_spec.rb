require 'rails_helper'

RSpec.describe SocialLink, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:profile) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:password) }

    end
end
