class ItemsController < ApplicationController

  def index
    
  end

  private
    def item_params
      params.require(:item).permit(:description, :status)
    end
end
