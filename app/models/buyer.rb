class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :buyers_stocks, dependent: :destroy
  has_many :transactions, dependent: :destroy

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver
  end
end
