class StoreFood < ActiveRecord::Base
  has_many :likes, :dependent => :destroy

  belongs_to :stores, :class_name => "Store", :foreign_key => "store_id"
  belongs_to :foods, :class_name => "Food", :foreign_key => "food_id"

  validates_presence_of :food_id, :store_id, :food_name

end
