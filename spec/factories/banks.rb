FactoryBot.define do 
	Factory :branch do
		name { Faker::Name.name(30) }
	end
end