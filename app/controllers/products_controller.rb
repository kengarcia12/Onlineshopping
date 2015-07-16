class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "admin_layout"
  respond_to :html

  def index
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at ASC")
    else
      @products = Product.all.order('created_at ASC')
    end
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  def upvote
    @product = Product.find(params[:id])

    if @product.votes.create(user_id: current_user.id)
      flash[:notice] = "Thank you for upvoting!"
      redirect_to(root_path)
    else
      flash[:notice] = "You have already upvoted this!"
      redirect_to(root_path)
    end
  end

  def downvote
    @product = Product.find(params[:id])
    @product.votes.last.destroy
    redirect_to(root_path)
  end

  def approve
    @product_approve = Product.find(params[:id])
    @product_approve.toggle!(:status)
    respond_to do |format|
      format.js
    end
  end


  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :available_size, :price, :category_id, :picture)
  end
end
