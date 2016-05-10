class User < ActiveRecord::Base
  # devise modules:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :trackable

  has_many :borrows

  def borrow(book)
    record = self.borrows.create(book: book, should_return_date: 2.weeks.from_now)

    book.available -= 1
    book.save

    record
  end
end
