class Character < ApplicationRecord
   # self.table_name = "characters"
    belongs_to :category
    belongs_to :race
end
