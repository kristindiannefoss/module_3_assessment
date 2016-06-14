class Api::V1::ItemsController < ApplicationController
  respond_to :json

  before_action :set_item, only: [:show, :destroy]

  def index
    respond_with Item.all
  end

  def show
    respond_with @item
  end

  def destroy
    respond_with @item.destroy
  end

  private
    def set_item
      @item = Item.find(params[:id].to_i)
    end
end
