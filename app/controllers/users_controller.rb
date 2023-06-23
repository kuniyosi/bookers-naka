class UsersController < ApplicationController

  def edit
  end

  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end
end
