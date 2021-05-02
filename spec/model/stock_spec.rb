require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe 'ActiveRecord associations' do
    it { expect(subject).to have_many(:buyers_stocks) }
    it { expect(subject).to belong_to(:broker) }
  end
end
