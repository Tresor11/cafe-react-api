class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    json_response(@items)
  end

  def create
    @item = Item.new(item_params)
    json_response(@item, :created) if @item.save!
  end

  def show
    @response = {
      item: Item.find(params[:id])
    }
    json_response(@response)
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    json_response(item)
  end

  def destroy
    Item.find(params[:id]).destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :category, :price, :image)
  end
end
