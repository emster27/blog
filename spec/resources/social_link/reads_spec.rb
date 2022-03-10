require 'rails_helper'

RSpec.describe SocialLinkResource, type: :resource do
  describe 'serialization' do
    let!(:social_link) { create(:social_link) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(social_link.id)
      expect(data.jsonapi_type).to eq('social_links')
    end
  end

  describe 'filtering' do
    let!(:social_link1) { create(:social_link) }
    let!(:social_link2) { create(:social_link) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: social_link2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([social_link2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:social_link1) { create(:social_link) }
      let!(:social_link2) { create(:social_link) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            social_link1.id,
            social_link2.id
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
            social_link2.id,
            social_link1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
