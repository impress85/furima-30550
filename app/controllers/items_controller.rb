class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end 

private
  def item_params
    params.require(:item).permit(:name,:price,:describe,:image).merge(user_id: current_user.id)
  end 

end
