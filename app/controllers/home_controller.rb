class HomeController < ApplicationController
  before_action :authenticate_user!
  layout "user_layout"
  respond_to :html

  def index
    @display_products = Product.all
  end

  def category_list
    @categories_active = Category.where("status = 1")
  end

  def category_products
    @products_user_select_active = Product.where("status = 1")
    @products = @products_user_select_active.all.where(:category_id => params[:category])
  end

  def search_products
    @categories_active = Category.where("status = 1")
    @show_by_category = Product.all.where(:category_id => params[:id])
  end
end
