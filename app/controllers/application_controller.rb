class ApplicationController < ActionController::Base
  def client
    IEX::Api::Client.new
  end
end
