class Borrow < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  # status for tracking borrow action
  PENDING   = "pending"
  CANCELLED = "cancelled"
  BORROWING = "borrowing"
  RETURNED  = "returned"
end
