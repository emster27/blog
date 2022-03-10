require "rails_helper"

RSpec.describe "settings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/settings", payload
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
          type: "settings",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(SettingResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Setting.count }.by(1)
    end
  end
end
