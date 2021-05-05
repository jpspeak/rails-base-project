# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@gmail.com', password: '123123', created_at: DateTime.now, updated_at: DateTime.now)
# Broker.create(email: 'broker@gmail.com', password: '123456', created_at: DateTime.now, updated_at: DateTime.now)
# Buyer.create(email: 'buyer@gmail.com', password: '123456', created_at: DateTime.now, updated_at: DateTime.now)

# Stock.create(broker_id: 1, symbol: 'BABA', company_name: 'Alibaba Group Holding Ltd - ADR', latest_price: 300, change: 3.22, change_percent: 0.01384, market_cap: 638313786672, created_at: DateTime.now, updated_at: DateTime.now)
# Stock.create(broker_id: 1, symbol: 'AAPL', company_name: 'APPLE BABY', latest_price: 190, change: 1.22, change_percent: 0.01384, market_cap: 238313786672, created_at: DateTime.now, updated_at: DateTime.now)

# BuyersStock.create(buyer_id: 1, stock_id: 2, quantity: 2, total_amount: 300.00, created_at: DateTime.now, updated_at: DateTime.now)
# BuyersStock.create(buyer_id: 1, stock_id: 1, quantity: 1, total_amount: 120.00, created_at: DateTime.now, updated_at: DateTime.now)

# Transaction.create(buyer_id: 1, stock_id: 2, price: 150.00, quantity: 2, total_amount: 300.00, created_at: DateTime.now, updated_at: DateTime.now)
# Transaction.create(buyer_id: 1, stock_id: 1, price: 120.00, quantity: 1, total_amount: 120.00, created_at: DateTime.now, updated_at: DateTime.now)