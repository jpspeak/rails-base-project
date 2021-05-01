require 'rails_helper'

RSpec.describe BuyersStock, type: :model do
  describe 'ActiveRecord associations' do
    it { expect(subject).to belong_to(:buyer) }
    it { expect(subject).to belong_to(:stock) }
  end
end