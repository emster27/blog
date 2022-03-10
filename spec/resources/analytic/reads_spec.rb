require 'rails_helper'

RSpec.describe AnalyticResource, type: :resource do
  describe 'serialization' do
    let!(:analytic) { create(:analytic) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(analytic.id)
      expect(data.jsonapi_type).to eq('analytics')
    end
  end

  describe 'filtering' do
    let!(:analytic1) { create(:analytic) }
    let!(:analytic2) { create(:analytic) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: analytic2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([analytic2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:analytic1) { create(:analytic) }
      let!(:analytic2) { create(:analytic) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            analytic1.id,
            analytic2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            analytic2.id,
            analytic1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
