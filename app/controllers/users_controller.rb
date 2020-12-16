class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book
    @books = @user.books.all
  end
end
