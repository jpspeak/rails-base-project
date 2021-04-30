class Buyers::HomeController < ApplicationController
    before_action :authenticate_buyer!
    before_action :client
    layout "buyers"

    def index
        
        @portfolio = current_buyer.buyers_stocks.includes(:stock)
        #     portfolio_stocks_symbol = portfolio.pluck(:symbol).join(',')            
        #     @portfolio = client.get("/stock/market/batch?symbols=#{portfolio_stocks_symbol}&types=quote", token: ENV['IEX_API_PUBLISHABLE_TOKEN'])         
        # end
    end
end
