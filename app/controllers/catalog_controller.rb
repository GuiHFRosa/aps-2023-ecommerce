class CatalogController < ApplicationController
  def index
    @products = Product.all
  end


  def add_to_cart(product)

  end
end
