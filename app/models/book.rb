class Book < ActiveRecord::Base
  paginates_per 12

  has_many :borrows

  def who_is_borrowing
    self.borrows.collect { |borrow| borrow.user if borrow.status == Borrow::BORROWING }.compact
  end

  def who_is_ordering
    self.borrows.collect { |borrow| borrow.user if borrow.status == Borrow::PENDING }.compact
  end
end
