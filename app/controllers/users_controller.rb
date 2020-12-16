class UsersController < ApplicationController
  
  def index
    @user = current_user
    @books = Book.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
