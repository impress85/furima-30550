class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image 
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :describe
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_cost_payer_id, numericality: { other_than: 1 }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :shipping_days_id, numericality: { other_than: 1 }
  end

  validates_inclusion_of :price, in:300..9999999, message: "outside the limits(¥300~¥9,999,999)"

end
