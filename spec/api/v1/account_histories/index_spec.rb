require 'rails_helper'

RSpec.describe "account_histories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/account_histories", params: params
  end

  describe 'basic fetch' do
    let!(:account_history1) { create(:account_history) }
    let!(:account_history2) { create(:account_history) }

    it 'works' do
      expect(AccountHistoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['account_histories'])
      expect(d.map(&:id)).to match_array([account_history1.id, account_history2.id])
    end
  end
end
