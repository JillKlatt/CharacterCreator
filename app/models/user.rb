class User < ApplicationRecord
    has_secure_password
    has_many :characters
    has_many :categories, through: :characters
    has_many :races, through: :characters
    has_many :adventures, through: :characters
    has_many :campaigns
    has_many :weapons
    validates :email, uniqueness: true, presence: true
    validates :name, presence: true
    # validates :password, length: {minimum: 2}
    # validates :password, confirmation: { case_sensitive_true }

end
