class SessionsController < ApplicationController
  
  def new
    if params[:format]
      user = User.find(params[:format])
      if is_admin
        session[:acting_as] = user.id
      else
        session[:user_id] = user.id
      end

      redirect_to movies_path, notice: "You are now logged in as #{user.firstname}"
    end

  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    if session[:acting_as]
      session[:acting_as] = nil
    else
      session[:user_id] = nil
    end
    redirect_to movies_path, notice: "Adios!"
  end
end
