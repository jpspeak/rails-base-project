require "rails_helper"
RSpec.describe Broker, :type => :model do

  describe 'validations' do
    subject { build(:broker) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end