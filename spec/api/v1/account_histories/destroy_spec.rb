require 'rails_helper'

RSpec.describe "account_histories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/account_histories/#{account_history.id}"
  end

  describe 'basic destroy' do
    let!(:account_history) { create(:account_history) }

    it 'updates the resource' do
      expect(AccountHistoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AccountHistory.count }.by(-1)
      expect { account_history.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
