class Buyers::BrokersController < ApplicationController
  before_action :authenticate_buyer!
  layout 'buyers'

  def index
    @brokers = Broker.all
  end

  def show
    @broker = Broker.where(id: params[:id]).includes(:stocks).first
  end
end
