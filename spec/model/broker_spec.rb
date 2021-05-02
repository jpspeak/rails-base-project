require 'rails_helper'

RSpec.describe Broker, type: :model do
  describe 'ActiveRecord associations' do
    it { expect(subject).to have_many(:stocks) }
  end

  describe 'Broker status' do
    it 'has a status of Unconfirmed if confirmed_at is nil' do
      broker = described_class.new(confirmed_at: nil)
      expect(broker.status).to eq 'Unconfirmed'
    end

    it 'has a status of Pending if confirmed_at is not nil and approved_at is nil' do
      broker = described_class.new(confirmed_at: DateTime.now, approved_at: nil)
      expect(broker.status).to eq 'Pending'
    end

    it 'has a status of Active if confirmed_at and approved_at is not nil' do
      broker = described_class.new(confirmed_at: DateTime.now, approved_at: DateTime.now)
      expect(broker.status).to eq 'Active'
    end
  end
end
