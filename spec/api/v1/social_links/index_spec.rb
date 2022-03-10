require "rails_helper"

RSpec.describe "social_links#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/social_links", params: params
  end

  describe "basic fetch" do
    let!(:social_link1) { create(:social_link) }
    let!(:social_link2) { create(:social_link) }

    it "works" do
      expect(SocialLinkResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["social_links"])
      expect(d.map(&:id)).to match_array([social_link1.id, social_link2.id])
    end
  end
end
