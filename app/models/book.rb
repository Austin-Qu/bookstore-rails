class Book < ApplicationRecord
  has_one :author
  has_one :category
end
