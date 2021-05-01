require 'rails_helper'

RSpec.describe BuyersStock, :type => :model do
    it { expect(subject).to belong_to(:buyer) }
    it { expect(subject).to belong_to(:stock) }
  end