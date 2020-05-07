require 'rails_helper'

RSpec.describe "account_histories#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/account_histories", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:account_history)
    end
    let(:payload) do
      {
        data: {
          type: 'account_histories',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AccountHistoryResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AccountHistory.count }.by(1)
    end
  end
end
