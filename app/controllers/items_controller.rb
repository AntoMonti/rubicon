class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:success] = "#{@item.name} was successfully created"
      redirect_to @item
    else
      flash[:error] = "Object has not been created"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(items_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "#{@item.name} was successfully deleted"
    render json:{ success: true }

  end

  def upvote
    @item = Item.find(params[:id])
    @item.increment! :votes_count
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50')
    render :index
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :real, :weight, :description)
  end
end
