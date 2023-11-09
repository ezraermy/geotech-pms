class User < ApplicationRecord
  has_many :assignments
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

# Attributes
validates :username, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
