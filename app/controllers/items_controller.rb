class ItemsController < ApplicationController
  before_action :authenticate_user!  , except: [:index,:show, :update]
  before_action :set_item, only: [:edit, :show, :update,:destroy]
  before_action :move_to_index,  only:[:edit, :update]
  before_action :sold_out, only: [:edit, :update, :destroy]

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

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  def destroy
    if user_signed_in? && (current_user.id == @item.user_id)
      @item.destroy
    end
     redirect_to root_path
  end

  
  private

  def item_params
    params.require(:item).permit(
      :name,:price,:describe,:image,:category_id,:condition_id,
      :prefecture_id,:shipping_cost_payer_id,:shipping_day_id
    ).merge(user_id: current_user.id)
  end 

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out
    if  @item.order !=nil
      redirect_to root_path
    end
  end

end
