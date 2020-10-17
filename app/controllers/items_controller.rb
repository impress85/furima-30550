class ItemsController < ApplicationController

  def index
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

private
  def item_params
    params.require(:item).permit(
      :name,:price,:describe,:image,:category_id,:condition_id,
      :prefectures_id,:shipping_cost_payer_id,:shipping_days_id
    ).merge(user_id: current_user.id)
  end 

end
