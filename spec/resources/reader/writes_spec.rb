require 'rails_helper'

RSpec.describe ReaderResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'readers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ReaderResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Reader.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:reader) { create(:reader) }

    let(:payload) do
      {
        data: {
          id: reader.id.to_s,
          type: 'readers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ReaderResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { reader.reload.updated_at }
      # .and change { reader.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:reader) { create(:reader) }

    let(:instance) do
      ReaderResource.find(id: reader.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Reader.count }.by(-1)
    end
  end
end
