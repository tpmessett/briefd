class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]
  before_action :authorize_user, only: [:update]  # Ensure the current user can edit the user
  before_action :find_user, only: [:update]  # Find the user to be updated

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def set_admin
    if current_user.is_admin?
      @user = User.find(params[:id])
      @user.update_columns(is_admin: !@user.is_admin)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      redirect_to root_path, notice: 'You are not authorised to do that.'
    end
  end

  def set_user_type
    if current_user.is_admin? || current_user.user_type == "admin"
      @user = User.find(params[:id])
      @user.update_columns(user_type: params[:type])
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      redirect_to root_path, notice: 'You are not authorised to do that.'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    # Protect the `is_admin` attribute
    if params[:user][:is_admin] == "true" && !current_user.is_admin?
      params[:user].delete(:is_admin)
    end

    # Protect the `user_type` attribute
    if params[:user][:user_type] && !(current_user.is_admin? || current_user.user_type == "admin")
      params[:user].delete(:user_type)
    end

    params.require(:user).permit(:first_name, :last_name, :position, :is_admin, :user_type, :client_id, :provider, :uid)
  end
end
