class BooksController < ApplicationController
  def guide
  end

  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find params[:id]
  end

  def borrow
    @book = Book.find params[:id]
    @record, @is_new_record = current_user.borrow @book

    render :show
  end
end
