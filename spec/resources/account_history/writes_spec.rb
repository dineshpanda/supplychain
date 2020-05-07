require 'rails_helper'

RSpec.describe AccountHistoryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'account_histories',
          attributes: attributes_for(:account_history)
        }
      }
    end

    let(:instance) do
      AccountHistoryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AccountHistory.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:account_history) { create(:account_history) }

    let(:payload) do
      {
        data: {
          id: account_history.id.to_s,
          type: 'account_histories',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AccountHistoryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { account_history.reload.updated_at }
      # .and change { account_history.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:account_history) { create(:account_history) }

    let(:instance) do
      AccountHistoryResource.find(id: account_history.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AccountHistory.count }.by(-1)
    end
  end
end
