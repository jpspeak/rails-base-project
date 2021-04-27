require 'rails_helper'
RSpec.describe Broker, type: :model do
  describe 'validations' do
    subject { build(:broker, :confirmed) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
