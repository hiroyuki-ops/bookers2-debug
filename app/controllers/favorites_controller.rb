class FavoritesController < ApplicationController
	before_action :set_variables
  def create
  	@favorite = current_user.favorites.create(book_id: params[:book_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
  	@book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_variables
    @book = Book.find(params[:book_id])
    @id_name = "#favorite-link-#{@book.id}"
  end

end
