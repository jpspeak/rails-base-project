class Brokers::HomeController < ApplicationController
    before_action :authenticate_broker!
    before_action :client
    layout "brokers"

    def index
        @portfolio = current_broker.stocks.order(:symbol)
        # if portfolio
        #     portfolio_stocks_symbol = portfolio.pluck(:symbol).join(',')            
        #     stocks_updated_data = client.get("/stock/market/batch?symbols=#{portfolio_stocks_symbol}&types=quote", token: ENV['IEX_API_PUBLISHABLE_TOKEN'])        
        # end
    end
end
