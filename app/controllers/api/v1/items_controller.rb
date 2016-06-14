class Api::V1::ItemsController < ApplicationController
  respond_to :json

  before_action :set_item, only: [:show, :destroy]

  def index
    respond_with Item.all
  end

  def show
    respond_with @item
  end

  def create
    respond_with Item.create(item_params), location: nil
  end

  def destroy
    respond_with @item.destroy
  end

  private
    def set_item
      @item = Item.find(params[:id].to_i)
    end

    def item_params
      params.require(:item).permit(:id, :name, :description, :image_url, :created_at, :updated_at)
    end
end
