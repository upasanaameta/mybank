class BanksController < ApplicationController
	skip_before_action :verify_authenticity_token		
		def create
			bank = Bank.new(bank_params)
			if bank.save
				render json: {bank: bank}, status: :ok 
			else
				render json: {errors: bank.errors.full_messages}, status: :unprocessable_entity
		    end
		end

		def show
			begin
				bank = Bank.find(params[:id])
				render json: {bank: bank}, status: :ok 
			rescue => e
				render json: {errors: e.message}, status: :unprocessable_entity
			end
		end

		def index
    		bank = Bank.all
    		render json: bank
			
  		end

  		def new
  			bank = Bank.new
  			redirect_to :action => 'index'

		end

		def update
   			bank = Bank.find(params[:id])
			if bank.update_attributes(bank_params)
      			redirect_to :action => 'show', :id => bank
   			else
      			subjects = Subject.all
      			
   			end
   		end

   		def destroy
   			Bank.find(params[:id]).destroy
   			redirect_to :action => 'index'
		end
		

		private
			def bank_params
				params.require(:bank).permit(:name)
			end

end





