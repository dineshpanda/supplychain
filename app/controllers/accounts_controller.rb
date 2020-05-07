class AccountsController < ApplicationController
  def index
    @accounts = Account.all

    render("account_templates/index.html.erb")
  end

  def show
    @account = Account.find(params.fetch("id_to_display"))

    render("account_templates/show.html.erb")
  end

  def new_form
    @account = Account.new

    render("account_templates/new_form.html.erb")
  end

  def create_row
    @account = Account.new

    @account.supplier_id = params.fetch("supplier_id")
    @account.acc_type = params.fetch("acc_type")

    if @account.valid?
      @account.save

      redirect_back(:fallback_location => "/accounts", :notice => "Account created successfully.")
    else
      render("account_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @account = Account.find(params.fetch("prefill_with_id"))

    render("account_templates/edit_form.html.erb")
  end

  def update_row
    @account = Account.find(params.fetch("id_to_modify"))

    @account.supplier_id = params.fetch("supplier_id")
    @account.acc_type = params.fetch("acc_type")

    if @account.valid?
      @account.save

      redirect_to("/accounts/#{@account.id}", :notice => "Account updated successfully.")
    else
      render("account_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @account = Account.find(params.fetch("id_to_remove"))

    @account.destroy

    redirect_to("/accounts", :notice => "Account deleted successfully.")
  end
end
