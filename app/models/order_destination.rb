class OrderDestination

  include ActiveModel::Model

  attr_accessor :postal_code, :municipality, :prefecture_id, :address, :building_name, :phone_number,
                :number,:exp_month,:exp_year,:cvc,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number , length: { in: 10..11 }
    validates :token
  end 

  def save
    order = Order.create(user_id: user_id , item_id: item_id)
    Destination.create(postal_code: postal_code, municipality: municipality, prefecture_id: prefecture_id,
                       address: address, building_name: building_name, phone_number: phone_number, order_id: order.id
                      )
  end


end