class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.order(:name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)

    if @user.save
      redirect_to users_path, notice: "User created."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])    
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_back(fallback_location: root_path, alert: "Access denied.")
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_back(fallback_location: root_path, notice: "User updated.")
    else
      redirect_back(fallback_location: root_path, notice: "Unable to update user.")
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless host_or_admin?
      redirect_back(fallback_location: root_path, :alert => "Access denied.")
    end
  end

  def secure_params
    if @user == current_user
      params.require(:user).permit(:name, :email, :prefs, :facebook_id)
    elsif (current_user.admin? || current_user.host?)
      params.require(:user).permit(:name, :email, :prefs, :facebook_id, :role)
    end
  end

end
