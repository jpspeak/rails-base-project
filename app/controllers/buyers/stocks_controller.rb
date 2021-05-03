class Buyers::StocksController < ApplicationController
  before_action :authenticate_buyer!
  layout 'buyers'

  def show
    @stock = Stock.find(params[:id])
    @stock_logo = client.get("/stock/#{@stock.symbol}/logo", token: ENV['IEX_API_PUBLISHABLE_TOKEN'])
  end

  def buy
    if params[:quantity].to_i <= 0
      flash[:error] = 'Quantity can\'t be blank'
      return redirect_to stock_path(params[:id])
    end

    stock = Stock.find(params[:id])
    stock_total_price = stock.latest_price * params[:quantity].to_i
    buyer_stock = BuyersStock.where(stock_id: stock.id).first
    
    if buyer_stock
      buyer_stock.quantity += params[:quantity].to_i
      buyer_stock.total_amount += stock_total_price
      buyer_stock.save
    else
      current_buyer.buyers_stocks.create(stock_id: params[:id], quantity: params[:quantity], total_amount: stock_total_price)
    end

    current_buyer.transactions.create(stock_id: params[:id], price: stock.latest_price, quantity: params[:quantity], total_amount: stock_total_price)
    flash[:success] = 'Transaction successful'
    redirect_to broker_path(stock.broker.id)
  end
end
