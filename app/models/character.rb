class Character < ApplicationRecord
    belongs_to :category
    belongs_to :race
end
