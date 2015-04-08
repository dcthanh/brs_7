class Category < ActiveRecord::Base
  has_many :books

  validates :name, presence: true, length: {minimum: 3}
  
  scope :search_by , ->content {where('content LIKE ?', "%#{content}%")}
end
