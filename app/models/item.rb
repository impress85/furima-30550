class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

end
