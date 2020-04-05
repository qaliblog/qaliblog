class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :require_user, except: [:show]
  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfuly created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category name was successfuly updated"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @category_articles  = @category.articles.recent_first.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @category.destroy
    flash[:danger] = "Category was successfully destroyed"
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
end
