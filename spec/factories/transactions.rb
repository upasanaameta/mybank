FactoryBot.define do 
	Factory :account do
		trans_type { Faker::String.random(30) }
		amount { Faker::Number.number(10) }
	end
end