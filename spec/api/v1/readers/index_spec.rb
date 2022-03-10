require "rails_helper"

RSpec.describe "readers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/readers", params: params
  end

  describe "basic fetch" do
    let!(:reader1) { create(:reader) }
    let!(:reader2) { create(:reader) }

    it "works" do
      expect(ReaderResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["readers"])
      expect(d.map(&:id)).to match_array([reader1.id, reader2.id])
    end
  end
end
