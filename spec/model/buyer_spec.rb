require 'rails_helper'
RSpec.describe Buyer, type: :model do
  describe 'validations' do
    subject { build(:buyer) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to have_many(:buyers_stocks) }
    it { is_expected.to have_many(:transactions) }
  end
end
