class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def index
    @book_new = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
        redirect_to book_path(@book), notice: "You have created book successfully."
    else
        @books = Book.all
        @user = current_user
        render :index
    end
  end

  def edit
  end

  def update
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
