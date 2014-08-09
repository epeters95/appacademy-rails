# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :text(255)        not null
#  created_at :datetime
#  updated_at :datetime
#  completed  :boolean
#

class Goal < ActiveRecord::Base
  validates :user_id, null: false
  
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many(
    :comments,
    as: :commentable  
  )
end
