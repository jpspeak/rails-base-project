class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :confirmable
  has_many :stocks, dependent: :destroy

  def status
    return 'Unconfirmed' if confirmed_at.nil?
    return 'Pending' if approved_at.nil?
    return 'Active' unless approved_at.nil?
  end
end
