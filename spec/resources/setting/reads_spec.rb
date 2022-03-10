require "rails_helper"

RSpec.describe SettingResource, type: :resource do
  describe "serialization" do
    let!(:setting) { create(:setting) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(setting.id)
      expect(data.jsonapi_type).to eq("settings")
    end
  end

  describe "filtering" do
    let!(:setting1) { create(:setting) }
    let!(:setting2) { create(:setting) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: setting2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([setting2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:setting1) { create(:setting) }
      let!(:setting2) { create(:setting) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      setting1.id,
                                      setting2.id,
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
                                      setting2.id,
                                      setting1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
