class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: {case_sensitive: false},
            length: (minimum: 3, maximum: 25)

  VALID_EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i          
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: (maximum: 105), format: {with: VALID_EMAIL_REGEX}
