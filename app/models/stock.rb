class Stock < ApplicationRecord
	has_many :buyers_stocks, dependent: :destroy
	belongs_to :broker
end
