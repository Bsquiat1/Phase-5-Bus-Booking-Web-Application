class Driver < ApplicationRecord
    has_one :bus
  
    validates :name, :email, :password_digest, presence: true
  end
  