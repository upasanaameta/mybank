class LoansController < ApplicationController
	skip_before_action :verify_authenticity_token		
		def create
			loans = Loans.new(loans_params)
			if loans.save
				render json: {loans: loans}, status: :ok 
			else
				render json: {errors: loans.errors.full_messages}, status: :unprocessable_entity
		    end
		end

		def show
			begin
				loans = Loans.find(params[:id])
				render json: {loans: loans}, status: :ok 
			rescue => e
				render json: {errors: e.message}, status: :unprocessable_entity
			end
		end

		def index
    		loans = Loans.all
    		render json: loans
		end


  		def new
  			loans = Loans.new
  			redirect_to :action => 'index'
		end

		def update
   			loans = Loans.find(params[:id])
			if loans.update_attributes(loans_params)
      			redirect_to :action => 'show', :id => loans
   			else
      			subjects = Subject.all
      		end
   		end

   		def destroy
   			Loans.find(params[:id]).destroy
   			redirect_to :action => 'index'
		end


		private
			def loans_params
				params.require(:loans).permit(:loan_type, :amount)
			end
		
end
