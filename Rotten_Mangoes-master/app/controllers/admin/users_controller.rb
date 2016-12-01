class Admin::UsersController < ApplicationController

  before_filter :authenticate_user

  def index
    @users = User.order("lastname").page(params[:page]).per(1)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
   
    redirect_to admin_users_path, notice: "User deleted"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "User updated"
    else
      render :edit
    end
  end

  protected

  def authenticate_user
    redirect_to '/' unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(
      :firstname, :lastname, :profile_type
    )
  end

end
