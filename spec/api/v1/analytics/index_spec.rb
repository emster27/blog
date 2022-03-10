require 'rails_helper'

RSpec.describe "analytics#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/analytics", params: params
  end

  describe 'basic fetch' do
    let!(:analytic1) { create(:analytic) }
    let!(:analytic2) { create(:analytic) }

    it 'works' do
      expect(AnalyticResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['analytics'])
      expect(d.map(&:id)).to match_array([analytic1.id, analytic2.id])
    end
  end
end
