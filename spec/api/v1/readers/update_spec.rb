require 'rails_helper'

RSpec.describe "readers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/readers/#{reader.id}", payload
  end

  describe 'basic update' do
    let!(:reader) { create(:reader) }

    let(:payload) do
      {
        data: {
          id: reader.id.to_s,
          type: 'readers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ReaderResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { reader.reload.attributes }
    end
  end
end
