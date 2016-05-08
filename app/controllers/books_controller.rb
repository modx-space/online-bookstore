class BooksController < ApplicationController
  def guide
  end

  def index
    @books = Book.page(params[:page])
  end
end
