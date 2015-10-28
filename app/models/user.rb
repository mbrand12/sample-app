class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
                   length: {maximum: 50}

  validates :email, presence: true,
                    length: {maximum: 255},
                    uniqueness: {case_sensitive: false},
                    format: {with: VALID_EMAIL_REGEX}

  before_save { self.email = email.downcase }
end
