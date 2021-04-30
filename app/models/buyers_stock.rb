class BuyersStock < ApplicationRecord
    belongs_to :buyer
    belongs_to :stock
end
