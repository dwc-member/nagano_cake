class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  # 投稿データの保存
  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @item_new = Item.new
  end

  def edit
  end

  def update
  end

  # 投稿データのストロングパラメータ
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active)
  end
end
