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
    if self.current_user && self.current_user.sample
      self.current_user.destroy
    end
    redirect_to "/"
  end


  ##############################omniauth

  def omniauth
  # do something with the auth_hash
  user = User.find_or_create_by_auth_hash(auth_hash)
  login(user)
  redirect_to root_url

end

protected

def auth_hash
  request.env['omniauth.auth']
end

end######
