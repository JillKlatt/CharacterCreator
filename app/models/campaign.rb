class Campaign < ApplicationRecord
    has_many :adventures
    has_many :characters, through: :adventures
end
