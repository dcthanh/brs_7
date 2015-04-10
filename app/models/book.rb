class Book < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_many :libraries
  has_many :reviews

  scope :books, -> book_ids {where(id: book_ids)}
end
