require 'rails_helper'

RSpec.describe "settings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/settings/#{setting.id}", params: params
  end

  describe 'basic fetch' do
    let!(:setting) { create(:setting) }

    it 'works' do
      expect(SettingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('settings')
      expect(d.id).to eq(setting.id)
    end
  end
end
