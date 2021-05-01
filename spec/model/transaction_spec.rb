require 'rails_helper'

RSpec.describe Transaction, type: :model do
	it { expect(subject).to belong_to(:stock) }
	it { expect(subject).to belong_to(:buyer) }
end