class User < ApplicationRecord
    has_many :posts

	validates :email, uniqueness: true, format: { with: /@/,
    message: "Debe contener un arroba" }
	validates :password_digest, presence: true, on: :create
	validates :password_digest, length: { in: 6..20 }, allow_nil: true
	validates :name, presence: true

	has_secure_password
	has_secure_password validation: false
end
