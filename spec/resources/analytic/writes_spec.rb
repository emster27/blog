require "rails_helper"

RSpec.describe AnalyticResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "analytics",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AnalyticResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Analytic.count }.by(1)
    end
  end

  describe "updating" do
    let!(:analytic) { create(:analytic) }

    let(:payload) do
      {
        data: {
          id: analytic.id.to_s,
          type: "analytics",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AnalyticResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { analytic.reload.updated_at }
      # .and change { analytic.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:analytic) { create(:analytic) }

    let(:instance) do
      AnalyticResource.find(id: analytic.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Analytic.count }.by(-1)
    end
  end
end
