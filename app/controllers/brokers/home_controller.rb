class Brokers::HomeController < ApplicationController
    before_action :authenticate_broker!
    layout "brokers"
    def index

    end
end
