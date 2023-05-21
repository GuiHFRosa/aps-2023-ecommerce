class CartController < ApplicationController
  def index
    @cart = Cart.includes(:cart_items).find_by(user_id: current_user.id)
    @cart = Cart.new(:user_id => current_user.id) unless @cart
  end
end
