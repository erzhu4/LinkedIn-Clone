class SessionsController < ApplicationController

  def create
    @user = User.find_by_creds(params[:email], params[:password])
    if @user
      login(@user)
      redirect_to "/site"
    else
      render "root/root"
    end
  end

  def destroy
    if self.current_user
      self.current_user.reset_token
      self.current_user.save
      session[:token] = nil
    end
    if self.current_user.sample
      self.current_user.destroy
    end
    redirect_to "/"
  end

end######
