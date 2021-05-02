class ApplicationController < ActionController::Base
  def client
    client = IEX::Api::Client.new
  end
end
