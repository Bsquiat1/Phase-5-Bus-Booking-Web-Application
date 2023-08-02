class Admin < ApplicationRecord
    has_many :buses
    has_many :drivers
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
