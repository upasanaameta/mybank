class BranchesController < ApplicationController
	skip_before_action :verify_authenticity_token		
		def create
			branches = Branches.new(branches_params)
			if branches.save
				render json: {branches: branches}, status: :ok 
			else
				render json: {errors: branches.errors.full_messages}, status: :unprocessable_entity
		    end
		end

		def show
			begin
				branches = Branches.find(params[:id])
				render json: {branches: branches}, status: :ok 
			rescue => e
				render json: {errors: e.message}, status: :unprocessable_entity
			end
		end

		def index
    		branches = Branches.all
    			render json: branches
			
  		end

  		def new
  			branches = Branches.new
  			redirect_to :action => 'index'
		end

		def update
   			branches = Branches.find(params[:id])
			if branches.update_attributes(branches_params)
      			redirect_to :action => 'show', :id => branches
   			else
      			subjects = Subject.all
      		end
   		end

   		def destroy
   			Branches.find(params[:id]).destroy
   			redirect_to :action => 'index'
		end

		private
			def branches_params
				params.require(:branches).permit(:name, :address, :number)
			end
		
end
