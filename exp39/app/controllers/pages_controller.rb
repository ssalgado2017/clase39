class PagesController < ApplicationController

  	def dashboard
  		@users = User.all
  	end


  	def destroy
  		@user = User.find(params[:user_id])
  		@user.destroy
    	respond_to do |format|
      		format.html { redirect_to pages_dashboard_path, notice: 'User was successfully destroyed.' }
    	end
  	end
end
