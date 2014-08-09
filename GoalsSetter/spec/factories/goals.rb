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

FactoryGirl.define do
  factory :goal do
  end
end
