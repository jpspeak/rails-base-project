require 'rails_helper'

RSpec.describe BuyersStock, type: :model do
  describe 'ActiveRecord associations' do
    subject { build(:buyers_stock) }

    it { is_expected.to belong_to(:buyer) }
    it { is_expected.to belong_to(:stock) }
  end
end
