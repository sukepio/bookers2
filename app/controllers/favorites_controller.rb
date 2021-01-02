class FavoritesController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    unless @book.favorited_by?(current_user)
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    current_user.favorites.find_by(book_id: @book.id).destroy
  end
  
end
