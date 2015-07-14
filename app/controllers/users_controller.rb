class UsersController < ApplicationController


  def new ## this goes from root page to personal info
    if (params[:user][:email].length == 0)
      @msg = "Email can't be blank!!"
      render "root/root"
      return
    elsif (params[:user][:password].length < 6)
      @msg = "Password must be atleast six characters long!!"
      render "root/root"
      return
    elsif (params[:user][:password] != params[:user][:password2])
      @msg = "Your passwords did not match!"
      render "root/root"
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

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to "user/home"
  end

  def destroy
  end

  ############################## end of basic user functions

  def home
    render :home
  end

  def user
    @user = self.current_user
    render "user"
  end

  private
  def user_params
    params.require(:user).permit(:email, :fname, :lname, :title,
                    :employer, :summary)
  end

end################
