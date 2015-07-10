class HomeController < ApplicationController
  before_action :authenticate_user!
  layout "user_layout"
  respond_to :html

  def index
    @products = Product.all
  end
end
