require 'rails_helper'
RSpec.describe Post, :type => :model do
  context "Branch validation" do

	it 'is a valid factory' do
      branch = FactoryBot.build(:branch)
      expect(branch).to be_valid
	  end

	it 'should have a branch_name' do
  		 expect(FactoryBot.build(:branch, name: nil)).to be_invalid
  		end

  it 'do not have blank branch_name' do
  		 expect(FactoryBot.build(:branch, name: '')).to be_invalid
  		end

  it 'allow string branch_name' do
  		 expect(FactoryBot.build(:branch, name: 'ftyfgc')).to be_valid
  		end


  it 'must have string branch_name' do
  		 expect(FactoryBot.build(:branch, name: '1343')).to be_invalid
  		end

  it 'should have a branch_address' do
  		 expect(FactoryBot.build(:branch, address: nil)).to be_invalid
  		end

  it 'allow branch_address' do
   		 expect(FactoryBot.build(:branch, address: '645 jhd hd')).to be_valid
   		end
 		

  it 'does not allow address blank' do
         expect(FactoryBot.build(:branch, address: '')).to be_invalid
        end

  it 'does not allow blank branch_number' do
      	 expect(FactoryBot.build(:branch, number: '')).to be_invalid
		end

	it 'should have a branch_number' do
  		 expect(FactoryBot.build(:branch, number: nil)).to be_invalid
  		end

  it 'allow integer branch_number' do
   		 expect(FactoryBot.build(:branch, number: '7234155373')).to be_valid
 		  end

  it 'does not allow non-integer branch_number' do
       expect(FactoryBot.build(:branch, number: '7234155.373')).to be_valid
      end

  it 'is invalid take string for number' do
         expect(FactoryBot.build(:branch, number: 'asdf12')).to be_invalid
        end

  it 'is invalid to exceed 10 digit in number' do
         expect(FactoryBot.build(:branch, number: '12345678912')).to be_invalid
		end

end