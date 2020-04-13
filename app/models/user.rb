class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :contacts, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates :lastname, presence: true, length: {minimum: 3, maximum: 25}
  validates :phonenumber, presence: true, numericality: { only_integer: true }
  validates :username, presence: true, uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}

  has_secure_password
  validates :password, confirmation: { case_sensitive: true }
end
