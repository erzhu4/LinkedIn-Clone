class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_creds(params[:email], params[:password])
    if @user
      login(@user)
      redirect_to "/user/home"
    else
      render :new
    end
  end

  def destroy
    if(self.current_user)
      self.current_user.reset_token
      self.current_user.save
      session[:token] = nil
    end
    redirect_to "/"
  end

end######
