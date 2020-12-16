class BooksController < ApplicationController
  

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = User.find(@book.user_id)
    @books = @user.books.all
    if @book.save
      redirect_to books_path
    else
      
      render template: "users/show"
    end
  end
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
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
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
