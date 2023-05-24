class CartController < ApplicationController
  def index
    @cart = get_cart
  end

  def add_cart_item
    product_id = params[:product_id]
    @cart = get_cart
    @cart_item = @cart.cart_items.find { |cart_item| cart_item.product_id == product_id  }
    @cart.cart_items.build(:cart_id => @cart.id, :product_id => product_id, :quantity => 1) unless @cart_item
    @cart.save
  end

  def add_cart_item_show
    add_cart_item
    redirect_to cart_path
  end

  def remove_cart_item
    id = params[:id]
    @cart_item = CartItem.find id
    @cart_item.destroy
    redirect_to cart_path
  end

  private
  def get_cart
    @cart = Cart.includes(:cart_items).find_by(user_id: current_user.id)
    @cart = Cart.new(:user_id => current_user.id) unless @cart
    @cart
  end
end
