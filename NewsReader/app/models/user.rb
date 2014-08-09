class User < ActiveRecord::Base
  has_many :feeds
  
  def generate_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    return self.session_token
  end
  
  def self.find_by_username_and_password(username, password)
    user = User.find_by_username(username)
    return nil unless user
    return (user.password == password ? user : nil)
  end
end
