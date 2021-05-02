class Brokers::StocksController < ApplicationController
  before_action :authenticate_broker!
  before_action :must_be_approved, only: [:create]
  layout 'brokers'

  def must_be_approved
    if current_broker.approved_at.nil?
      flash[:error] = 'Sorry, your account is not yet approved'
      redirect_to new_stocks_path
    end
  end

  def new
    @stock = Stock.new
    @mostactive = client.stock_market_list(:mostactive)
    @gainers = client.stock_market_list(:gainers)
  end

  def create
    @stock = current_broker.stocks.create(stock_params)
    flash[:success] = 'Stock added successfully'
    redirect_to broker_root_path
  end

  def search
    respond_to do |format|
      if params[:symbol]
        @stock_added = current_broker.stocks.where(symbol: params[:symbol].upcase).first || false
        begin
          @stock_quote = client.quote(params[:symbol])
          @stock_logo = client.get("/stock/#{params[:symbol]}/logo", token: ENV['IEX_API_PUBLISHABLE_TOKEN'])
        rescue StandardError => e
          @stock_quote = {}
        end
      end
      format.js { render 'brokers/stocks/search' }
    end
  end

  private

  def stock_params
    params.permit(:symbol, :company_name, :latest_price, :change, :change_percent, :market_cap)
  end
end
