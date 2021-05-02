require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'ActiveRecord associations' do
    subject { build(:transaction) }

    it { is_expected.to belong_to(:stock) }
    it { is_expected.to belong_to(:buyer) }
  end
end
