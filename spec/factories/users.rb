FactoryBot.define do 
	Factory :branch do
		name { Faker::Name.name(30) }
		address { Faker::Address.full_address(50) }
		number { Faker::Number.number(10) }
		age { Faker::Number.number(2) }

	end
end