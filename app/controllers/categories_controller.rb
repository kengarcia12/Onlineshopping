class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "admin_layout"

  respond_to :html

  def index
    @categories = Category.all
    @categories_active = Category.where("status = 1")
    @categories_inactive = Category.where("status = 0")
    respond_with(@categories)
  end

  def show
    @categories = Category.find(params[:id])
    @products = @categories.products
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category_name, :description, :picture, :status)
    end
end
