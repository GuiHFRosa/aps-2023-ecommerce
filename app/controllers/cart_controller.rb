class CartController < ApplicationController
  def index
    @cart = get_cart
  end

  def add_cart_item(product_id)
    @cart = get_cart
    @cart.cart_items.find { |cart_item| cart_item.product_id == product_id  }
    @cart_item = CartItem.new(:cart_id => @cart.id, :product_id => product_id, :quantity => 1)
  end

  private
  def get_cart
    @cart = Cart.includes(:cart_items).find_by(user_id: current_user.id)
    @cart = Cart.new(:user_id => current_user.id) unless @cart
  end
end
