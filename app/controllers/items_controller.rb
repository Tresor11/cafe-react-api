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
      item: @item
    }
    json_response(@response)
  end

  def update
    @item.update!(item_params)
    json_response(@item)
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :type, :price, :image)
  end

  def item
    @item = Item.find(params[:id])
  end
end
