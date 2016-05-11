class User < ActiveRecord::Base
  # devise modules:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :trackable

  has_many :borrows

  def borrow(book)
    if is_borrowing?(book)
      record = Borrow.find_by book: book, user: self, is_returned: false
      new_record = false
    else
      record = self.borrows.create(book: book, should_return_date: 2.weeks.from_now)
      book.available -= 1
      book.save
      new_record = true
    end

    [record, new_record]
  end

  private
  def is_borrowing?(book)
    self.borrows.to_ary.collect { |borrow| borrow.book_id }.include?(book.id)
  end
end
