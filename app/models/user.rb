class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end


  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy                            
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :libraries, dependent: :destroy

  def follow user
    active_relationships.create followed_id: user.id
  end

  def unfollow user
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following? user
    following.include? user
  end

  def added? book
    book_ids = libraries.pluck :book_id
    book_ids.include? book.id
  end

  def myLibrary
    book_ids = libraries.pluck :book_id
    Book.books book_ids
  end
end
