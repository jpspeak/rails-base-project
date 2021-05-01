class Admins::BrokerPendingRegistrationsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def index
    @brokers = Broker.where(approved_at: nil).where.not(confirmed_at: nil).order(created_at: :desc)
  end

  def approve
    broker = Broker.find(params[:id])
    broker.update(approved_at: DateTime.now)
    UserMailer.send_broker_approved_email(broker).deliver
    flash[:success] = 'Broker approved successfully'
    redirect_to admin_broker_pending_registrations_path
  end
end
