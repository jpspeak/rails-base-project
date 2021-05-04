class Admins::HomeController < ApplicationController
  before_action :authenticate_admin!
  before_action :pending_broker_count
  layout 'admins'

  def index
    @buyers = Buyer.order(created_at: :desc)
    @brokers = Broker.order(created_at: :desc)
  end
end
