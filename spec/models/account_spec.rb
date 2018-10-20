require 'rails_helper'
RSpec.describe Post, :type => :model do
  context "Account validation" do

	it 'is a valid factory' do
      account = FactoryBot.build(:account)
      expect(account).to be_valid
	  end

	it 'does not allow blank account_number' do
      	 expect(FactoryBot.build(:account, number: '')).to be_invalid
		end

	it 'should have a account_number' do
  		 expect(FactoryBot.build(:account, number: nil)).to be_invalid
  		end

  	it 'allow integer account_number' do
   		 expect(FactoryBot.build(:account, number: '1563725378635')).to be_valid
 		end

 	it 'does not allow non-integer account_number' do
   		 expect(FactoryBot.build(:account, number: '156372537.85')).to be_invalid
 		end

  	it 'is invalid take string for account_number' do
         expect(FactoryBot.build(:account, number: 'asdf12')).to be_invalid
        end

    it 'is invalid to exceed 20 digit in account_number' do
         expect(FactoryBot.build(:account, number: '5373538334846342738363437335')).to be_invalid
		end

	it 'has a acc_type' do
       expect(FactoryBot.build(:account, acc_type: nil)).to be_invalid
      end

    it 'does not allow blank acc_type' do
         expect(FactoryBot.build(:account, acc_type: '')).to be_invalid
    	end 

    it 'has valid acc_type' do
         expect(FactoryBot.build(:account, acc_type: 'Current')).to be_valid
        end

    it 'has valid acc_type' do
         expect(FactoryBot.build(:account, acc_type: 'Saving')).to be_valid
        end

    it 'can not have number as acc_type' do
         expect(FactoryBot.build(:account, acc_type: '1234')).to be_invalid
        end

    it 'can not have float as acc_type' do
         expect(FactoryBot.build(:account, acc_type: '12.34')).to be_invalid
        end

     it 'does not allow blank balance' do
      	 expect(FactoryBot.build(:account, balance: '')).to be_invalid
		end

	it 'should have a balance' do
  		 expect(FactoryBot.build(:account, balance: nil)).to be_invalid
  		end

    it 'does not allow balance less than 1500' do
  		 expect(FactoryBot.build(:account, balance: '1000')).to be_invalid
  		end

  	it 'allow balance more than 1500' do
  		 expect(FactoryBot.build(:account, balance: '15000')).to be_valid
  		end

  	it 'allow balance equal to 1500' do
  		 expect(FactoryBot.build(:account, balance: '1500')).to be_valid
  		end

  	it 'allow balance in float' do
  		 expect(FactoryBot.build(:account, balance: '15000.7457')).to be_valid
  		end

  	it 'is invalid take string for balance' do
         expect(FactoryBot.build(:account, balance: 'asdf12')).to be_invalid
        end

end





