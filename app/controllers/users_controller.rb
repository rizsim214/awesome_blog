class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      redirect_to signin_url 
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash.now[:success] = "Successfully Updated" + params[:name].to_s
      redirect_to user_url(@user)
    else
      redirect_to "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  private 
    def user_params
      params.require(:user).permit(:name , :email, :password, :password_confirmation)
    end
end
