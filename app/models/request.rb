class Request < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def set_default_status?
    approval_status = "Pending"
  end
end
