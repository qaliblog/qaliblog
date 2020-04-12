class Contact < ActiveRecord::Base
  scope :recent_first, -> {order(created_at: :desc)}
  
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 1000}
end
