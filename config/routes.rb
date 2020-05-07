Rails.application.routes.draw do
  devise_for :suppliers
  # Routes for the Supplier resource:

  # READ
  get("/suppliers", { :controller => "suppliers", :action => "index" })
  get("/suppliers/:id_to_display", { :controller => "suppliers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
