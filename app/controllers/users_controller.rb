class UsersController < ApplicationController
  before_filter :authenticate_user!
 
  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def show
    @user = User.find params[:id]
    if !params[:type].blank? && ['following', 'followers'].include?(params[:type])
      @title = params[:type]
      @users = @user.send(params[:type])
      @users = @users.paginate page: params[:page]
      render 'show_user_follow' 
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes secure_params
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, alert: "Unable to update user."
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, alert: "Access denied."
    end
  end
  
  def secure_params
    params.require(:user).permit :role
  end
end