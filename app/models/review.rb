class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  has_many :comments

  validates :user, :book, :text, presence: true
  validates :rating_out_of_ten, numericality: {only_integer: true, 
                                               greater_than_or_equal_to: 1, 
                                               less_than_or_equal_to: 10}
end
