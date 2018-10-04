class Transactions < ApplicationRecord
	validates :trans_type, presence: true, length:{maximum: 30}
	validates :amount, presence: true, length:{maximum: 10}


	after_create :transaction_action

	private
		def transaction_action
			if self.trans_type.casecmp "withdraw" == 0
				Accounts.balance = Accounts.balance - self.amount
				Accounts.save
			
			elsif self.trans_type.casecmp "deposit" == 0
				Accounts.balance = Accounts.balance + self.amount
				Accounts.save

			else 
				errors.add(:type, "Invalid transaction type.")
			end
		end

end