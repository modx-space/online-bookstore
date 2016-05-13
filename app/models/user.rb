class User < ActiveRecord::Base
  # devise modules:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :trackable

  has_many :borrows

  def borrow(book)
    if is_ordering_or_borrowing?(book)
      record = Borrow.find_by book: book, user: self, status: [Borrow::PENDING, Borrow::BORROWING]
      is_new_record = false
    else
      record = self.borrows.create(book: book, should_return_date: 2.weeks.from_now, status: Borrow::BORROWING)
      book.available -= 1
      book.save
      is_new_record = true
    end

    [record, is_new_record]
  end

  def order(book)
    if is_ordering_or_borrowing?(book)
      record = Borrow.find_by book: book, user: self, status: [Borrow::PENDING, Borrow::BORROWING]
      is_new_record = false
    else
      record = self.borrows.create(book: book, status: Borrow::PENDING)
      is_new_record = true
    end

    [record, is_new_record]
  end

  private
  def is_ordering_or_borrowing?(book)
    ordered_or_borrowed_books = self.borrows.collect do |borrow|
      borrow.book if [Borrow::PENDING, Borrow::BORROWING].include?(borrow.status)
    end

    ordered_or_borrowed_books.include?(book)
  end
end
