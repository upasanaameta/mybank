class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
    	t.string :trans_type
		t.float :amount
		
		t.timestamps
    end
  end
end
