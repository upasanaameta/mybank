class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token		
		def create
			users = Users.new(users_params)
			if users.save
				render json: {users: users}, status: :ok 
			else
				render json: {errors: users.errors.full_messages}, status: :unprocessable_entity
		    end
		end

		def show
			begin
				users = Users.find(params[:id])
				render json: {users: users}, status: :ok 
			rescue => e
				render json: {errors: e.message}, status: :unprocessable_entity
			end
		end

		def index
    		users = Users.all
    		render json: users
		end

  		def new
  			users = Users.new
  			redirect_to :action => 'index'
		end

		def update
   			users = Users.find(params[:id])
			if users.update_attributes(users_params)
      			redirect_to :action => 'show', :id => users
   			else
      			subjects = Subject.all
      			
   			end
   		end

   		def destroy
   			Users.find(params[:id]).destroy
   			redirect_to :action => 'index'
		end

		private
			def users_params
				params.require(:users).permit(:name, :address, :number, :age)
			end
		
end
