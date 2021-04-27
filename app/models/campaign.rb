class Campaign < ApplicationRecord
    has_many :adventures
    has_many :characters, through: :adventures
    #belongs_to :user, optional: true

    accepts_nested_attributes_for :characters
end
