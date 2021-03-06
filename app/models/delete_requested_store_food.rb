class DeleteRequestedStoreFood < ApplicationModel
  belongs_to :user
  belongs_to :store_food
  has_one :store, :through => :store_food
  has_one :food, :through => :store_food
  
  validates_presence_of :user_id, :store_food_id
end
