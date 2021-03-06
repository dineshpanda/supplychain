require 'rails_helper'

RSpec.describe "suppliers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/suppliers", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:supplier)
    end
    let(:payload) do
      {
        data: {
          type: 'suppliers',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SupplierResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Supplier.count }.by(1)
    end
  end
end
