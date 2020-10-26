class OrdersController < ApplicationController
 before_action :authenticate_user! 
 before_action :set_item
 before_action :move_to_index

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?  
      pay_item
      @order_destination.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

    def order_destination_params
      params
      .require(:order_destination)
      .permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number)
      .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end 

    def set_item
      @item = Item.find(params[:item_id])
    end


    def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_destination_params[:token],
      currency: 'jpy'
    )
    end

    def move_to_index
      if (@item.order !=nil) || (current_user.id == @item.user_id)
        redirect_to root_path
      end
    end

  
end