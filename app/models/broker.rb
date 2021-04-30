class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :confirmable
  has_many :stocks, dependent: :destroy

  def status
    if self.confirmed_at.nil?
      return "Unconfirmed"
    end
    if self.approved_at.nil?
      return "Pending"
    end
    if !self.approved_at.nil?
      return "Active"
    end
  end
end
