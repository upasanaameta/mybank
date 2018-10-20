require 'rails_helper'
RSpec.describe Post, :type => :model do
  context "User validation" do

  	it 'is a valid factory' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
	  end

	it 'should have a user_name' do
  		 expect(FactoryBot.build(:user, name: nil)).to be_invalid
  		end

  	it 'do not have blank user_name' do
  		 expect(FactoryBot.build(:user, name: '')).to be_invalid
  		end

  	it 'allow string user_name' do
  		 expect(FactoryBot.build(:user, name: 'abcdefg')).to be_valid
  		end

  	it 'allow string user_name' do
  		 expect(FactoryBot.build(:user, name: 'abcd efgh')).to be_valid
  		end


  	it 'must have string user_name' do
  		 expect(FactoryBot.build(:user, name: '1343')).to be_invalid
  		end

  	it 'should have a user_address' do
  		 expect(FactoryBot.build(:user, address: nil)).to be_invalid
  		end

  	it 'allow user_address' do
   		 expect(FactoryBot.build(:user, address: '645 jhd hd')).to be_valid
   		end
 		

  	it 'does not allow user_address blank' do
         expect(FactoryBot.build(:user, address: '')).to be_invalid
        end

    it 'does not allow blank user_number' do
      	 expect(FactoryBot.build(:user, number: '')).to be_invalid
		end

	it 'should have a user_number' do
  		 expect(FactoryBot.build(:user, number: nil)).to be_invalid
  		end

  	it 'allow integer user_number' do
   		 expect(FactoryBot.build(:user, number: '7234155373')).to be_valid
 		end

  	it 'does not allow non-integer user_number' do
   		 expect(FactoryBot.build(:user, number: '72341553.86')).to be_valid
 		end

  	it 'is invalid take string for user_number' do
         expect(FactoryBot.build(:user, number: 'asdf12')).to be_invalid
        end

    it 'is invalid to exceed 10 digit in user_number' do
         expect(FactoryBot.build(:user, number: '12345678912')).to be_invalid
		end

	it 'does not allow blank age' do
      	 expect(FactoryBot.build(:user, age: '')).to be_invalid
		end

	it 'should have a age' do
  		 expect(FactoryBot.build(:user, age: nil)).to be_invalid
  		end

  	it 'allow integer age' do
   		 expect(FactoryBot.build(:user, age: '72')).to be_valid
 		end

  	it 'does not allow non-integer age' do
   		 expect(FactoryBot.build(:user, age: '72.86')).to be_valid
 		end

  	it 'is invalid take string for age' do
         expect(FactoryBot.build(:user, age: 'asdf12')).to be_invalid
        end

    it 'is invalid to exceed 2 digit in age' do
         expect(FactoryBot.build(:user, age: '1230')).to be_invalid
		end

	it 'is invalid age less than 10' do
         expect(FactoryBot.build(:user, age: '7')).to be_invalid
		end

	it 'is valid age equal to 10' do
         expect(FactoryBot.build(:user, age: '10')).to be_valid
		end

	it 'is valid age more than 10' do
         expect(FactoryBot.build(:user, age: '50')).to be_valid
		end

end






