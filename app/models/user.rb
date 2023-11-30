class User < ApplicationRecord
       # Devise modules
       devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable
     
       # Associations
       has_many :assignments
     
       # Additional attributes and validations
       validates :username, presence: true, uniqueness: true
       validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
     
