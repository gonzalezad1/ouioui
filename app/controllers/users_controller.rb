class UsersController < ApplicationController
  
  
  def show
    # @user = User.new
    @user = User.find(params[:id])
  end

end
