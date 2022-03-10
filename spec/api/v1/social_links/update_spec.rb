require "rails_helper"

RSpec.describe "social_links#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/social_links/#{social_link.id}", payload
  end

  describe "basic update" do
    let!(:social_link) { create(:social_link) }

    let(:payload) do
      {
        data: {
          id: social_link.id.to_s,
          type: "social_links",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SocialLinkResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { social_link.reload.attributes }
    end
  end
end
