class Project < ApplicationRecord 
    has_many :assignments, dependent: :destroy
    has_many :users, through: :assignments

    validates :name, presence: true
    validates :location, presence: true
    validates :task, presence: true
    validates :date, presence: true
end
