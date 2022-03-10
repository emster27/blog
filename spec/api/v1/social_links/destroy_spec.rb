require 'rails_helper'

RSpec.describe "social_links#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/social_links/#{social_link.id}"
  end

  describe 'basic destroy' do
    let!(:social_link) { create(:social_link) }

    it 'updates the resource' do
      expect(SocialLinkResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SocialLink.count }.by(-1)
      expect { social_link.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
