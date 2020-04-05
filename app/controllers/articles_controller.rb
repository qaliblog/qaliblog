class ArticlesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :set_article, only: [:show, :destroy, :edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @articles = Article.recent_first.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfuly updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was successfuly created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
  end
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfuly destroyed"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :photo, :description, category_ids: [])
  end
  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
end
