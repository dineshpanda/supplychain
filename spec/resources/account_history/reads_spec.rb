require 'rails_helper'

RSpec.describe AccountHistoryResource, type: :resource do
  describe 'serialization' do
    let!(:account_history) { create(:account_history) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(account_history.id)
      expect(data.jsonapi_type).to eq('account_histories')
    end
  end

  describe 'filtering' do
    let!(:account_history1) { create(:account_history) }
    let!(:account_history2) { create(:account_history) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: account_history2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([account_history2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:account_history1) { create(:account_history) }
      let!(:account_history2) { create(:account_history) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            account_history1.id,
            account_history2.id
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
            account_history2.id,
            account_history1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
