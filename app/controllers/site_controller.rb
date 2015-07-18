class SiteController < ApplicationController

  def root
    if logged_in?
      redirect_to "/site"
    else
      render "root/root"
    end
  end

end
