require 'rails_helper'

RSpec.describe SocialLinkResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'social_links',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SocialLinkResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SocialLink.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:social_link) { create(:social_link) }

    let(:payload) do
      {
        data: {
          id: social_link.id.to_s,
          type: 'social_links',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SocialLinkResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { social_link.reload.updated_at }
      # .and change { social_link.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:social_link) { create(:social_link) }

    let(:instance) do
      SocialLinkResource.find(id: social_link.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SocialLink.count }.by(-1)
    end
  end
end
