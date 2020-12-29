class BooksController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = User.find(@book.user_id)
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @post_comment = PostComment.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    
  end
  
  def ensure_correct_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
    redirect_to books_path
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
