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
  end
end
