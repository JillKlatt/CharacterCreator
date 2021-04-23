class User < ApplicationRecord
    has_secure_password
    has_many :characters
    has_many :categories, through: :characters
    has_many :races, through: :characters
    has_many :adventures, through: :characters
end
