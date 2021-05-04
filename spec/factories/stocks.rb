FactoryBot.define do
  factory :stock do
    broker_id { 1 }
    symbol { 'BABA' }
    company_name { 'TestCompany' }
    latest_price { 300.0 }
    change { 3.22 }
    change_percent { 0.01384 }
    market_cap { 638_313_786_672.0 }
  end
end
