require "rails_helper"

RSpec.describe "analytics#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/analytics/#{analytic.id}", payload
  end

  describe "basic update" do
    let!(:analytic) { create(:analytic) }

    let(:payload) do
      {
        data: {
          id: analytic.id.to_s,
          type: "analytics",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AnalyticResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { analytic.reload.attributes }
    end
  end
end
