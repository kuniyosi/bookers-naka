class BooksController < ApplicationController

  def show
  end

  def index
    @book_new = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
