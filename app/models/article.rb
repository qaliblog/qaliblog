class Article < ActiveRecord::Base
  scope :recent_first, -> {order(created_at: :desc)}
  belongs_to :user
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 500}
  validates :user_id, presence: true
  has_attached_file :photo, :styles => { large: "600x600>", medium: "300x300>", thumb: "100x100>" },
                  :url  => "/assets/articles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  translates :title, :string
  translates :description, :text
end
