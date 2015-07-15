class User < ActiveRecord::Base
  validates :email, :fname, :lname, presence: true

  has_many(
    :connects,
    class_name: "Connection",
    foreign_key: :user_id1,
    primary_key: :id
  )

  has_many(:connections, through: :connects, source: :user2)

  has_many(
    :incoming_requests,
    class_name: "Request",
    foreign_key: :responder_id,
    primary_key: :id
  )

  has_many(:requests, through: :incoming_requests, source: :sender)

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
