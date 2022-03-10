require 'rails_helper'

RSpec.describe "analytics#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/analytics/#{analytic.id}", params: params
  end

  describe 'basic fetch' do
    let!(:analytic) { create(:analytic) }

    it 'works' do
      expect(AnalyticResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('analytics')
      expect(d.id).to eq(analytic.id)
    end
  end
end
