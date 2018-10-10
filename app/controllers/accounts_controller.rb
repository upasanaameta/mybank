class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token		
		def create
			accounts = Accounts.new(accounts_params)
			if accounts.save
				render json: {accounts: accounts}, status: :ok 
			else
				render json: {errors: accounts.errors.full_messages}, status: :unprocessable_entity
		    end
		end

		def show
			begin
				accounts = Accounts.find(params[:id])
				render json: {accounts: accounts}, status: :ok 
			rescue => e
				render json: {errors: e.message}, status: :unprocessable_entity
			end
		end

		def index
    		accounts = Accounts.all
    		render json: accounts
		end

  		def new
  			accounts = Accounts.new
  			redirect_to :action => 'index'
		end

		def update
   			accounts = Accounts.find(params[:id])
			if accounts.update_attributes(accounts_params)
      			redirect_to :action => 'show', :id => accounts
   			else
      			subjects = Subject.all
      			
   			end
   		end

   		def destroy
   			Accounts.find(params[:id]).destroy
   			redirect_to :action => 'index'
		end

		private
			def accounts_params
				params.require(:accounts).permit(:number, :acc_type, :balance)
			end
		
end
