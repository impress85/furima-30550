class Order < ApplicationRecord
  validates :user, presence: true
  validates :item, presence: true

  belongs_to :item
  belongs_to :user
  has_one :destination

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
