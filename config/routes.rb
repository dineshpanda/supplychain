Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "accounts#index"
  # Routes for the Account history resource:

  # CREATE
  get("/account_histories/new", { :controller => "account_histories", :action => "new_form" })
  post("/create_account_history", { :controller => "account_histories", :action => "create_row" })

  # READ
  get("/account_histories", { :controller => "account_histories", :action => "index" })
  get("/account_histories/:id_to_display", { :controller => "account_histories", :action => "show" })

  # UPDATE
  get("/account_histories/:prefill_with_id/edit", { :controller => "account_histories", :action => "edit_form" })
  post("/update_account_history/:id_to_modify", { :controller => "account_histories", :action => "update_row" })

  # DELETE
  get("/delete_account_history/:id_to_remove", { :controller => "account_histories", :action => "destroy_row" })

  #------------------------------

  # Routes for the Account resource:

  # CREATE
  get("/accounts/new", { :controller => "accounts", :action => "new_form" })
  post("/create_account", { :controller => "accounts", :action => "create_row" })

  # READ
  get("/accounts", { :controller => "accounts", :action => "index" })
  get("/accounts/:id_to_display", { :controller => "accounts", :action => "show" })

  # UPDATE
  get("/accounts/:prefill_with_id/edit", { :controller => "accounts", :action => "edit_form" })
  post("/update_account/:id_to_modify", { :controller => "accounts", :action => "update_row" })

  # DELETE
  get("/delete_account/:id_to_remove", { :controller => "accounts", :action => "destroy_row" })

  #------------------------------

  devise_for :suppliers
  # Routes for the Supplier resource:

  # READ
  get("/suppliers", { :controller => "suppliers", :action => "index" })
  get("/suppliers/:id_to_display", { :controller => "suppliers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
