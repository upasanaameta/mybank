FactoryBot.define do 
	Factory :account do
		number { Faker::Number.number(20) }
		acc_type { Faker::String.random(30) }
		balance { Faker::Number.number }
	end
end