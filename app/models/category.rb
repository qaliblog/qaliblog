class Category < ActiveRecord::Base
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 2, maximum: 25}
  translates :name, :string
end
