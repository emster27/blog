require 'rails_helper'

RSpec.describe SettingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'settings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SettingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Setting.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:setting) { create(:setting) }

    let(:payload) do
      {
        data: {
          id: setting.id.to_s,
          type: 'settings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SettingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { setting.reload.updated_at }
      # .and change { setting.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:setting) { create(:setting) }

    let(:instance) do
      SettingResource.find(id: setting.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Setting.count }.by(-1)
    end
  end
end
