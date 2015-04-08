class Book < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_many :reviews
  
  validates :title, presence: true
  validates :author, presence: true
  validates :length, presence: true
  validates :category, presence: true
  
  def self.search(search, filter, category)
    if search
      if category.blank?
        where("#{filter} LIKE ?", "%#{search}%")
      else
        where("category_id = ? AND #{filter} LIKE ?", "#{category}", "%#{search}%")
      end
    else
      all
    end
  end
  
end
