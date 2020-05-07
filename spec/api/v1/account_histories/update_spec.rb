require 'rails_helper'

RSpec.describe "account_histories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/account_histories/#{account_history.id}", payload
  end

  describe 'basic update' do
    let!(:account_history) { create(:account_history) }

    let(:payload) do
      {
        data: {
          id: account_history.id.to_s,
          type: 'account_histories',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AccountHistoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { account_history.reload.attributes }
    end
  end
end
