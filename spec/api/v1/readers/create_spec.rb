require 'rails_helper'

RSpec.describe "readers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/readers", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'readers',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ReaderResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Reader.count }.by(1)
    end
  end
end
