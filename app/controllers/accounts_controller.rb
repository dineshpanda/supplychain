class AccountsController < ApplicationController
  before_action :current_supplier_must_be_account_supplier, :only => [:edit_form, :update_row, :destroy_row]

  def current_supplier_must_be_account_supplier
    account = Account.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_supplier == account.supplier
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Account.ransack(params[:q])
    @accounts = @q.result(:distinct => true).includes(:supplier, :account_history).page(params[:page]).per(10)

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
