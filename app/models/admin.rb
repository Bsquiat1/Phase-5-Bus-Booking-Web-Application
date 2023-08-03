class Admin < ApplicationRecord
    has_secure_password
    has_many :buses
    has_many :drivers
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    def generate_jwt
        payload = { user_id: id, is_admin: true }
        Jsonwebtoken.encode(payload)
      end
end
