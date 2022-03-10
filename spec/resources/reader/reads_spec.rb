require "rails_helper"

RSpec.describe ReaderResource, type: :resource do
  describe "serialization" do
    let!(:reader) { create(:reader) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(reader.id)
      expect(data.jsonapi_type).to eq("readers")
    end
  end

  describe "filtering" do
    let!(:reader1) { create(:reader) }
    let!(:reader2) { create(:reader) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: reader2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([reader2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:reader1) { create(:reader) }
      let!(:reader2) { create(:reader) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      reader1.id,
                                      reader2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      reader2.id,
                                      reader1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
