class Admins::TransactionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :pending_broker_count
  layout 'admins'

  def index
    @transactions = Transaction.order(created_at: :desc)
  end
end
