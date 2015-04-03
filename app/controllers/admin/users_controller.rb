class Admin::UsersController < ApplicationController

  before_action :be_admin

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(admin_user_params)

    if @user.save
      redirect_to admin_users_path, notice: "#{@user.firstname} created!"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(admin_user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    UserMailer.deleted_email(@user).deliver
    redirect_to admin_users_path
  end

  protected

  def be_admin

    if !current_user.admin 
     flash[:alert] = "You must be an admin to view that page." 
     redirect_to movies_path 
    end 
  end

  def admin_user_params
    params.require(:user).permit(
      :firstname, :lastname, :email, :admin, :password, :password_confirmation
    )
  end

end
