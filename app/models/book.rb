class Book < ActiveRecord::Base
  paginates_per 12
end
