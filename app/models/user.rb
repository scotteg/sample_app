class User < ActiveRecord::Base
  has_secure_password
  before_save {email.downcase!}
  validates(:name, {presence: true, length: {maximum: 50}})
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # Allows foo@bar..com
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates(:email, {presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}})
  validates(:password, {length: {minimum: 6}})
  validates(:password_confirmation, {presence: true})
end
