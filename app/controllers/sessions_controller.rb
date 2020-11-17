class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
