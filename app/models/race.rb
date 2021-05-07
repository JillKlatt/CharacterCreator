class Race < ApplicationRecord
    has_many :characters
    # accepts_nested_attributes_for :characters
end
