require "rails_helper"

RSpec.describe "analytics#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/analytics/#{analytic.id}"
  end

  describe "basic destroy" do
    let!(:analytic) { create(:analytic) }

    it "updates the resource" do
      expect(AnalyticResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Analytic.count }.by(-1)
      expect { analytic.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
