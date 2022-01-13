class StaticPagesController < ApplicationController
  def home
    if logged_in?
      render "users/homefeed"
    end
  end

  def about
  end

  def contact
  end
end
