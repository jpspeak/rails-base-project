class ApplicationController < ActionController::Base
  def client
    IEX::Api::Client.new
  end

  def pending_broker_count
    @pending_broker_count = Broker.where.not(confirmed_at: nil).where(approved_at: nil).count
  end
end
