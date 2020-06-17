class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    Item.create(items_params)
    render body: 'created'
  end

  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description)
  end
end
