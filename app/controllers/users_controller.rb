class UsersController < ApplicationController

  def new
    if (params[:user][:password] != params[:user][:password2])## bugs with redirect?
      render "alerts/pwMatch"
      return
    elsif (params[:user][:password].length < 6)
      render "alerts/pwLength"
      return
    elsif (params[:user][:email].length == 0)
      render "alerts/email"
      return
    end
    @user = User.new({email: params[:user][:email]})
    @user.password_digest = BCrypt::Password.create(params[:user][:password])
    render :new
  end

  def create
    @user = User.new({
      email: params[:user][:email],
      password_digest: params[:user][:password_digest],
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      title: params[:user][:title],
      employer: params[:user][:employer],
      summary: params[:user][:summary]
      })

      if @user.save
        self.login(@user)
        redirect_to "/user/home"
      else
        render :new
      end
  end

  def home
    render :home
  end

end################
