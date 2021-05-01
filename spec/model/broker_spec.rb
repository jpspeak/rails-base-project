require 'rails_helper'

RSpec.describe Broker, type: :model do
	it { expect(subject).to have_many(:stocks) }

	it 'should have a status of Unconfirmed if confirmed_at is nil' do
		broker = Broker.new(confirmed_at: nil)
		expect(broker.status).to eq 'Unconfirmed'
	end

	it 'should have a status of Pending if confirmed_at is not nil and approved_at is nil' do
		broker = Broker.new(confirmed_at: DateTime.now, approved_at: nil)
		expect(broker.status).to eq 'Pending'
	end

	it 'should have a status of Active if confirmed_at and approved_at is not nil' do
		broker = Broker.new(confirmed_at: DateTime.now, approved_at: DateTime.now)
		expect(broker.status).to eq 'Active'
	end
end