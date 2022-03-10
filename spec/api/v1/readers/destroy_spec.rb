require 'rails_helper'

RSpec.describe "readers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/readers/#{reader.id}"
  end

  describe 'basic destroy' do
    let!(:reader) { create(:reader) }

    it 'updates the resource' do
      expect(ReaderResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Reader.count }.by(-1)
      expect { reader.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
