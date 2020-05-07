class Api::V1::AccountHistoriesController < Api::V1::GraphitiController
  def index
    account_histories = AccountHistoryResource.all(params)
    respond_with(account_histories)
  end

  def show
    account_history = AccountHistoryResource.find(params)
    respond_with(account_history)
  end

  def create
    account_history = AccountHistoryResource.build(params)

    if account_history.save
      render jsonapi: account_history, status: 201
    else
      render jsonapi_errors: account_history
    end
  end

  def update
    account_history = AccountHistoryResource.find(params)

    if account_history.update_attributes
      render jsonapi: account_history
    else
      render jsonapi_errors: account_history
    end
  end

  def destroy
    account_history = AccountHistoryResource.find(params)

    if account_history.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: account_history
    end
  end
end
