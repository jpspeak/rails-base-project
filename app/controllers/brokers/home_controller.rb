class Brokers::HomeController < ApplicationController
	before_action :authenticate_broker!
	before_action :client
	layout 'brokers'

	def index
		@portfolio = current_broker.stocks.order(:symbol)
	end
end
