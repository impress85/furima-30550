class OrdersController < ApplicationController

  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)

    if @order_destination.valid?  
      @order_destination.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
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

  
end