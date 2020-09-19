class BookCommentsController < ApplicationController
  def create
  	@book = Book.find(params[:book_id])
  	@book_new = Book.new
  	@book_comment = @book.book_comments.new(book_comment_params)
  	@book_comment.user_id = current_user.id
    if @book_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  	@book = Book.find(params[:book_id])
    @book_comment = current_user.book_comment.find_by(id: params[:id])
    @book_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:content, :book_id)
  end

end
