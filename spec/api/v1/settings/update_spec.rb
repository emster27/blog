require "rails_helper"

RSpec.describe "settings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/settings/#{setting.id}", payload
  end

  describe "basic update" do
    let!(:setting) { create(:setting) }

    let(:payload) do
      {
        data: {
          id: setting.id.to_s,
          type: "settings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SettingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { setting.reload.attributes }
    end
  end
end
