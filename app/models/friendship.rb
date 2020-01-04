# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_friendships_on_friend_id  (friend_id)
#  index_friendships_on_user_id    (user_id)
#

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
end
