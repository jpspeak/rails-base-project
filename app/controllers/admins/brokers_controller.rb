class Admins::BrokersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def new
    @broker = Broker.new
  end

  def create
    @broker = Broker.new(broker_params)
    @broker.skip_confirmation!
    @broker.approved_at = DateTime.now
    if @broker.save
      flash[:success] = 'User created successfully'
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def edit
    @broker = Broker.find(params[:id])
  end

  def update
    @broker = Broker.find(params[:id])
    if @broker.update(params.require(:broker).permit(:email))
      flash[:success] = 'User updated successfully'
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def show
    @broker = Broker.find(params[:id])
  end

  private

  def broker_params
    params.permit(:email, :password, :password_confirmation)
  end
end
