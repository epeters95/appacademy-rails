# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'securerandom'
require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, :session_token, presence: true
  before_validation { self.reset_session_token if self.session_token.nil? }

  def password
    BCrypt::Password.new(self.password_digest)
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
  
  def reset_session_token!
    self.reset_session_token
    self.save!
    self.session_token
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if user && user.password == password
  end
  
  has_many(
    :goals,
    class_name: "Goal",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many(
    :comments,
    as: :commentable  
  )
    
end
