class AccountHistoriesController < ApplicationController
  def index
    @account_histories = AccountHistory.page(params[:page]).per(10)

    render("account_history_templates/index.html.erb")
  end

  def show
    @account_history = AccountHistory.find(params.fetch("id_to_display"))

    render("account_history_templates/show.html.erb")
  end

  def new_form
    @account_history = AccountHistory.new

    render("account_history_templates/new_form.html.erb")
  end

  def create_row
    @account_history = AccountHistory.new

    @account_history.owner_id = params.fetch("owner_id")

    if @account_history.valid?
      @account_history.save

      redirect_back(:fallback_location => "/account_histories", :notice => "Account history created successfully.")
    else
      render("account_history_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @account_history = AccountHistory.find(params.fetch("prefill_with_id"))

    render("account_history_templates/edit_form.html.erb")
  end

  def update_row
    @account_history = AccountHistory.find(params.fetch("id_to_modify"))

    @account_history.owner_id = params.fetch("owner_id")

    if @account_history.valid?
      @account_history.save

      redirect_to("/account_histories/#{@account_history.id}", :notice => "Account history updated successfully.")
    else
      render("account_history_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @account_history = AccountHistory.find(params.fetch("id_to_remove"))

    @account_history.destroy

    redirect_to("/account_histories", :notice => "Account history deleted successfully.")
  end
end
