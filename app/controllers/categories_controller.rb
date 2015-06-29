class CategoriesController < ApplicationController
  before_action :find_category, only: [:update, :edit, :destroy, :show]
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @goals = Goal.where(category_id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save 
      flash[:notice]= "Category created successfully!"
      redirect_to(categories_path)
    else
      flash[:error]= "Category creation failed!"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice]= "Successfully updated!"
      redirect_to(categories_path)
    else
      flash[:error]= "Update Failed!"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:alert]="Category deleted!"
    end
    redirect_to(categories_path)
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id, :private, :cat_pic)
  end

  def find_category
    @category = Category.find_by(id: params[:id]) 
    unless @category
      render(text: "Sorry that category was not found.", status: :not_found)
    end
  end
end
