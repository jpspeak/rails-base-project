class Admins::BuyersController < ApplicationController
  before_action :authenticate_admin!
  before_action :pending_broker_count
  layout 'admins'

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.save
      flash[:success] = 'User created successfully'
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update(params.require(:buyer).permit(:email))
      flash[:success] = 'User updated successfully'
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def show
    @buyer = Buyer.find(params[:id])
  end

  private

  def buyer_params
    params.require(:buyer).permit(:email, :password, :password_confirmation)
  end
end
