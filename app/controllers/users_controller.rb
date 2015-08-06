require "byebug"

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
      summary: params[:user][:summary]
      })

    if @user.save
      self.login(@user)
      redirect_to "/site"
    else
      render :new
    end
  end


  def destroy
    @user = User.find_by({id: params[:id]})
    @user.destroy if @user
    redirect_to "/site"
  end

  ############################## end of basic user functions start of guest log in

  def guest_login
    user = User.make_guest_user
    if user.save
      self.login(user);
      Experience.create({user_id: user.id, title: "Sample position", employer: "Sample Employer", description: "sample description"})
      Education.create({user_id: user.id, school: "App Academy", field: "Software Development", graduation_year: 2015})
      Request.create(sender_id: 11, responder_id: user.id)
      Request.create(sender_id: 1, responder_id: user.id)
      redirect_to "/site"
    else
      redirect_to "/"
    end
  end

  ################################ end of guest log in start of api functions

  def home
    if current_user && current_user.admin
      @twitter_users = User.where({tweet: true})
      @guests = User.where({sample: true})
    end
    render :app
  end

  def user
    @user = self.current_user
    render "user"
  end

  def update_current #Updates the current user of profile being viewed.
    @user = User.includes(:requests, :requests,
    :connections, :experiences, :educations).find_by(id: params[:id])
    @user.update(user_params)
    render text: ""
  end

  def profile_user
    @user = User.includes(:requests, :requests,
    :connections, :experiences, :educations).find_by(id: params[:id]);
    render "user"
  end

  def random_users
    if logged_in?
      connection_ids = self.current_user.connections.pluck(:id)
      @users = User.random_users(
                                  connection_ids,
                                  self.current_user.id
                                  )
    end
    render json: @users
  end

  def delete_all_guests
    guests = User.where({sample: true})
    guests.each do |guest|
      guest.destroy
    end
    redirect_to "/site"
  end

  private
  def user_params
    params.require(:user).permit(:email, :fname, :lname, :title, :summary)
  end

end################
