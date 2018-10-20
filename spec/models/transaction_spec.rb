require 'rails_helper'
RSpec.describe Post, :type => :model do
  context "Transaction validation" do

	it 'is a valid factory' do
      transaction = FactoryBot.build(:transaction)
      expect(transaction).to be_valid
	  end

	it 'has a trans_type' do
       expect(FactoryBot.build(:transaction, trans_type: nil)).to be_invalid
      end

    it 'does not allow blank trans_type' do
         expect(FactoryBot.build(:transaction, trans_type: '')).to be_invalid
        end 

    it 'has valid trans_type' do
         expect(FactoryBot.build(:transaction, trans_type: 'deposit')).to be_valid
        end

    it 'has valid trans_type' do
         expect(FactoryBot.build(:transaction, trans_type: 'withdraw')).to be_valid
        end
 	
    it 'can not have number as trans_type' do
         expect(FactoryBot.build(:transaction, trans_type: '1234')).to be_invalid
        end

    it 'can not have float as trans_type' do
         expect(FactoryBot.build(:transaction, trans_type: '12.34')).to be_invalid
        end

    it 'invalid trans_type' do
         expect(FactoryBot.build(:transaction, trans_type: 'ab15hg')).to be_invalid
        end

    it 'should have amount' do
       expect(FactoryBot.build(:transaction, amount: nil)).to be_invalid
      end

    it 'does not allow blank amount' do
         expect(FactoryBot.build(:transaction, amount: '')).to be_invalid
        end

    it 'is invalid take string for amount' do
         expect(FactoryBot.build(:transaction, amount: 'asdf12')).to be_invalid
        end

    it 'does not allow amount more than balance for withdraw' do
    	dummy = FactoryBot.create(:account, balance: '10000')
        expect(FactoryBot.build(:transaction, trans_type: 'withdraw', amount: '15000', account_id: dummy.id)).to be_invalid
		end

	it 'does not allow amount equal balance for withdraw' do
    	dummy1 = FactoryBot.create(:account, balance: '10000')
        expect(FactoryBot.build(:transaction, trans_type: 'withdraw', amount: '10000', account_id: dummy1.id)).to be_invalid
		end

	it 'valid amount for withdraw' do
    	dummy2 = FactoryBot.create(:account, balance: '10000')
        expect(FactoryBot.build(:transaction, trans_type: 'withdraw', amount: '5000', account_id: dummy2.id)).to be_valid
		end

end







