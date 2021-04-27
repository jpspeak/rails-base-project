class Buyers::HomeController < ApplicationController
  before_action :authenticate_buyer!
  layout 'buyers'
  def index; end
end
