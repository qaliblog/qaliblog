class UsersController < ApplicationController
<<<<<<< HEAD
  def indexs
=======
  def index
>>>>>>> Admin-users-show
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
<<<<<<< HEAD
   @user = User.new(user_params)
   if @user.save
     flash[:success] = "welcome to alphablog #{@user.username}"
     redirect_to articles_path
   else
     render 'new'
   end
  end
  def edit
   @user = User.find(params[:id])
  end
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:success] = "Your account was updated successfully"
     redirect_to articles_path
   else
     render 'edit'
   end
  end
  def show
   @user = User.find(params[:id])
  end
  private
  def user_params
   params.require(:user).permit(:username, :email, :password)
=======
    @user = User.new(user_params)
    if @user.save
    flash[:success] = "welcome to alphablog #{@user.username}"
    redirect_to articles_path
    else
    render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:success] = "Your account was updated successfully"
    redirect_to articles_path
    else
    render 'edit'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
>>>>>>> Admin-users-show
  end
end
