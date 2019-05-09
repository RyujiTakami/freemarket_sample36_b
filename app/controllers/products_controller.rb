class ProductsController < ApplicationController
  def index
    # 各カテゴリーの商品を無作為に４つずつ取得
    @products_ladies = Product.get_random_product(1)
    @products_mans = Product.get_random_product(2)
    @products_kids = Product.get_random_product(3)
    @products_interiors = Product.get_random_product(4)
    @products_books = Product.get_random_product(5)
    @products_toys = Product.get_random_product(6)
    @products_perfumes = Product.get_random_product(7)
    @products_appliances = Product.get_random_product(8)
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
    @seller = User.find(@product.seller_id)
    @seller_items = Product.where(seller_id: @seller.id).where.not(id: @seller.id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save(item_params)
      # 商品の出品完了
      # モーダルウィンドウが出てくる
    else
      # 画面はそのままで保存できない旨のメッセージの表示
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduce, :price, :parent_category_id, :child_category_id, :grandchild_category_id, :shipping_method, :condition, :delivery_fee_payer, :area, :days_to_delivery, :image).merge(seller_id: current_user.id)
  end
end
