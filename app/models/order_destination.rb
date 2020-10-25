class OrderDestination

  include ActiveModel::Model

  attr_accessor :postal_code, :municipality, :prefecture_id, :address, :building_name, :phone_number,
                :number,:exp_month,:exp_year,:cvc,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number
    # validates :number
    # validates :exp_month
    # validates :exp_year
    # validates :cvc
  end 

  def save
    order = Order.create(user_id: user_id , item_id: item_id)
    Destination.create(postal_code: postal_code, municipality: municipality, prefecture_id: prefecture_id,
                       address: address, building_name: building_name, phone_number: phone_number, order_id: order.id
                      )
  end


end