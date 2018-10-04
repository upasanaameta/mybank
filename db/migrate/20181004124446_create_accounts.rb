class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
    	t.integer :number
		t.string :acc_type
		t.float :balance

		t.timestamps
    end
  end
end
