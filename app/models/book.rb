class Book < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_many :libraries
  has_many :reviews

  scope :books, -> book_ids {where(id: book_ids)}
  scope :find_name, -> search {where("name LIKE '%#{search}%'")}
  scope :find_title, -> search {where("title LIKE '%#{search}%'")}
  scope :find_category, -> search {where("category_id LIKE '%#{search}%'")}
  scope :find_author, -> search {where("author LIKE '%#{search}%'")}

  def self.find_book search, type
    case type
    when '1' 
      @books = Book.find_name search
    when '2' 
      @books = Book.find_title search
    when '3' 
      @books = Book.find_category search
    when '4' 
      @books = Book.find_author search
    else 
      @books = Book.all
    end
  end
end
