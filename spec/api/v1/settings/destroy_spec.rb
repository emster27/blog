require 'rails_helper'

RSpec.describe "settings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/settings/#{setting.id}"
  end

  describe 'basic destroy' do
    let!(:setting) { create(:setting) }

    it 'updates the resource' do
      expect(SettingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Setting.count }.by(-1)
      expect { setting.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
