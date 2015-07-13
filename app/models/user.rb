class User < ActiveRecord::Base
  validates :email, :fname, :lname, presence: true

  def self.find_by_creds(email, password)
    @user = User.find_by(email: email)
    if @user && BCrypt::Password.new(@user.password_digest).is_password?(password)
      return @user
    else
      return nil
    end
  end

  def reset_token
    self.session_token = SecureRandom::urlsafe_base64(16)
  end



end#######
