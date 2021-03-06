class Following < ApplicationModel#ActiveRecord::Base
  belongs_to :following_user, :class_name => "User", :foreign_key => "following_user_id"
  belongs_to :followed_user, :class_name => "User", :foreign_key => "followed_user_id"  
  
  validates_presence_of :following_user_id, :followed_user_id
  validates_uniqueness_of  :following_user_id, :scope => [:followed_user_id]
  
  after_create :increase_follow_count
  before_destroy :decrease_follow_count
  
  private
  def increase_follow_count
    User.update_all("following_count = following_count + 1", "id = #{self.following_user_id}")
    User.update_all("follower_count = follower_count + 1", "id = #{self.followed_user_id}")
  end
  
  def decrease_follow_count
    User.update_all("following_count = following_count - 1", "id = #{self.following_user_id}")
    User.update_all("follower_count = follower_count - 1", "id = #{self.followed_user_id}")
  end

end
