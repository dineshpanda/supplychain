class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all

    render("supplier_templates/index.html.erb")
  end

  def show
    @supplier = Supplier.find(params.fetch("id_to_display"))

    render("supplier_templates/show.html.erb")
  end
end
