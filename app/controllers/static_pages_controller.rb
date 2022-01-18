class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = Micropost.new
      @microposts = current_user.microposts.order(created_at: :desc).paginate(page: params[:page] , per_page: 5)
      render "users/homefeed"
    end
  end

  def about
  end

  def contact
  end
end
