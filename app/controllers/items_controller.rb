class ItemsController < ApplicationController
  before_action :authenticate_user!  , except: [:index,:show]

  def index
    @items = Item.all.order("created_at ASC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new  
    end
  end 

  def show
    @item = Item.find(params[:id])
    @item_prefectures_name = Prefecture.find(@item.prefectures_id).name
    @item_shipping_days_name = ShippingDay.find(@item.shipping_days_id).name
  end

private
  def item_params
    params.require(:item).permit(
      :name,:price,:describe,:image,:category_id,:condition_id,
      :prefectures_id,:shipping_cost_payer_id,:shipping_days_id
    ).merge(user_id: current_user.id)
  end 

end
