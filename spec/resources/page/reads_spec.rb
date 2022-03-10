require 'rails_helper'

RSpec.describe PageResource, type: :resource do
  describe 'serialization' do
    let!(:page) { create(:page) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(page.id)
      expect(data.jsonapi_type).to eq('pages')
    end
  end

  describe 'filtering' do
    let!(:page1) { create(:page) }
    let!(:page2) { create(:page) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: page2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([page2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:page1) { create(:page) }
      let!(:page2) { create(:page) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            page1.id,
            page2.id
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
            page2.id,
            page1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
