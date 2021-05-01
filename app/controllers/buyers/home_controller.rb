class Buyers::HomeController < ApplicationController
	before_action :authenticate_buyer!
	before_action :client
	layout 'buyers'

	def index
		@portfolio = current_buyer.buyers_stocks.includes(:stock)
	end
end
