Rails.application.routes.draw do
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
