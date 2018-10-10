class TransactionsController < ApplicationController
	skip_before_action :verify_authenticity_token		
		def create
			transactions = Transactions.new(transactions_params)
			if transactions.save
				render json: {transactions: transactions}, status: :ok 
			else
				render json: {errors: transactions.errors.full_messages}, status: :unprocessable_entity
		    end
		end

		def show
			begin
				transactions = Transactions.find(params[:id])
				render json: {transactions: transactions}, status: :ok 
			rescue => e
				render json: {errors: e.message}, status: :unprocessable_entity
			end
		end

		def index
    		transactions = Transactions.all
    			render json: transactions
			
  		end

  		def new
  			transactions = Transactions.new
  			redirect_to :action => 'index'
		end

		def update
   			transactions = Transactions.find(params[:id])
			if transactions.update_attributes(transactions_params)
      			redirect_to :action => 'show', :id => transactions
   			else
      			subjects = Subject.all
      			
   			end
   		end

   		def destroy
   			Transactions.find(params[:id]).destroy
   			redirect_to :action => 'index'
		end

   		private
			def transactions_params
				params.require(:transactions).permit(:trans_type, :amount)
			end
		
end
