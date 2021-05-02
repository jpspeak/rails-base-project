class Admins::TransactionsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def index
    @transactions = Transaction.order(created_at: :desc)
  end
end
