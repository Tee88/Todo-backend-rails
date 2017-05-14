class ItemsController < ApplicationController

  def index
    @items = Item.all
    respond_to do |format|
      format.json { render :json => @items }
    end
  end

  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.json { render :json => @item }
    end
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.json { render :json => @item }
      else
        format.json { render :json => @item.errors.full_messages , :status => :bad_request }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.json { render :json => @item }
      else
        format.json { render :json => @item.errors.full_messages , :status => :bad_request }
      end
    end
  end
   
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.json { render :json => @items }
    end
  end

  private
    def item_params
      params.require(:item).permit(:description, :status)
    end
end
