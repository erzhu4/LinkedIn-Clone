class User < ActiveRecord::Base
  validates :email, :fname, :lname, presence: true

  has_many(
    :connects,
    class_name: "Connection",
    foreign_key: :user_id1,
    primary_key: :id,
    dependent: :destroy
  )
  ##### for dependent destroy only
  has_many(
    :connects_other_side,
    class_name: "Connection",
    foreign_key: :user_id2,
    primary_key: :id,
    dependent: :destroy
  )
#################################
  has_many(:connections, through: :connects, source: :user2)

  has_many(
    :outgoing_requests,
    class_name: "Request",
    foreign_key: :sender_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :incoming_requests,
    class_name: "Request",
    foreign_key: :responder_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :experiences,
    class_name: "Experience",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :educations,
    class_name: "Education",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
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

################################OmniAuth

def self.find_or_create_by_auth_hash(auth_hash)
  user = User.find_by(
          # provider: auth_hash[:provider],
          provider: "twitter",
          uid: auth_hash[:uid])

  unless user
    user = User.create!(
          # provider: auth_hash[:provider],
          provier: "twitter",
          uid: auth_hash[:uid],
          fname: auth_hash[:info][:name].split.first,
          lname: auth_hash[:info][:name].split.last,
          email: auth_hash[:info][:nickname], #bad solution
          password: SecureRandom::urlsafe_base64)
  end

  user
end


end#######
