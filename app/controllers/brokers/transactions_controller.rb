class Brokers::TransactionsController < ApplicationController
    before_action :authenticate_broker!
    layout 'brokers'

    def index
        @transactions = Transaction.where(stock_id: current_broker.stocks.ids).order(created_at: :desc)
    end
end
