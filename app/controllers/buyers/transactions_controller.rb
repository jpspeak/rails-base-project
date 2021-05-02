class Buyers::TransactionsController < ApplicationController
  before_action :authenticate_buyer!
  layout 'buyers'

  def index
    @transactions = current_buyer.transactions.includes(:stock).order(created_at: :desc)
  end
end
