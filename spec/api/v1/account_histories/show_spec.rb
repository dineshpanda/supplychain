require 'rails_helper'

RSpec.describe "account_histories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/account_histories/#{account_history.id}", params: params
  end

  describe 'basic fetch' do
    let!(:account_history) { create(:account_history) }

    it 'works' do
      expect(AccountHistoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('account_histories')
      expect(d.id).to eq(account_history.id)
    end
  end
end
