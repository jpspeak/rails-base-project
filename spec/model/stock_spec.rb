require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe 'ActiveRecord associations' do
    subject { build(:stock) }

    it { is_expected.to have_many(:buyers_stocks) }
    it { is_expected.to belong_to(:broker) }
  end
end
