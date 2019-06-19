class RegistrationsController < ApplicationController
	prepend_before_action :require_no_auth
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    respond_to do |format|
      if @user.save
      	redirect_to root_path
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
