class BooksController < ApplicationController
  before_action :find_book, :check_ordering_and_borrowing, except: [:guide, :index]

  def guide
  end

  def index
    @books = Book.page(params[:page])
  end

  def show
  end

  def borrow
    @record, @is_new_record = current_user.borrow @book

    render :show
  end

  def order
    @record, @is_new_record = current_user.order @book

    render :show
  end

  private
  def find_book
    @book = Book.find params[:id]
  end

  def check_ordering_and_borrowing
    @who_is_borrowing = @book.who_is_borrowing
    @who_is_ordering  = @book.who_is_ordering
  end
end
