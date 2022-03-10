require 'rails_helper'

RSpec.describe "social_links#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/social_links/#{social_link.id}", params: params
  end

  describe 'basic fetch' do
    let!(:social_link) { create(:social_link) }

    it 'works' do
      expect(SocialLinkResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('social_links')
      expect(d.id).to eq(social_link.id)
    end
  end
end
