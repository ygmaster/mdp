class CreateFollowings < ActiveRecord::Migration
  def self.up
    create_table :followings do |t|
      t.integer :following_user_id, :null => false
      t.integer :followed_user_id, :null => false
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :followings
  end
end
