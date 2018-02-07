class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category, optional: true
end
