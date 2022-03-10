require 'rails_helper'

RSpec.describe "settings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/settings", params: params
  end

  describe 'basic fetch' do
    let!(:setting1) { create(:setting) }
    let!(:setting2) { create(:setting) }

    it 'works' do
      expect(SettingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['settings'])
      expect(d.map(&:id)).to match_array([setting1.id, setting2.id])
    end
  end
end
