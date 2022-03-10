require "rails_helper"

RSpec.describe "social_links#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/social_links", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "social_links",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(SocialLinkResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { SocialLink.count }.by(1)
    end
  end
end
