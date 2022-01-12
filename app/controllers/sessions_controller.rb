class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        login(@user)
        flash[:success] = "Successfully logged in!"
        redirect_to user_url(@user)
      else
        flash.now[:danger] = "Your credentials are incorrect!"
        render "new"
      end
  end

  

  def destroy
    logout
    flash[:success] = "Successfully logged Out!"
    redirect_to root_url
  end
end
