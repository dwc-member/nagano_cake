class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  # 投稿データの保存
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @item_new = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  # 投稿データのストロングパラメータ
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active)
  end
end
