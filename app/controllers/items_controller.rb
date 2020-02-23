class ItemsController < ApplicationController

    def index
    #   @items = Item.includes(:images).order('created_at DESC')
      @products = Product.order("created_at DESC").limit(5)

    end

    def new
    # 出品画面を表示するためのアクション
    # form_withを使うためにまずインスタンス生成をする（空っぽのインスタンスの準備）
    @product = Product.new
    @product.images.new
    product_condition
    end

    def create
    # 保存する処理
        @product = Product.create(product_params)
        # @product = Item.includes(:images).order('created_at DESC').limit(10)

    end

    def edit
    end

    def update
    end

    def show
        @product = Product.find(params[:id])
        @images = @product.images
    end

    private
    def product_params
        params.require(:product).permit(:name, :price ,:description, :condition, images_attributes: [:src]).merge(user_id: 1)
    end
    def product_condition
        @condition = ["新品、未使用","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
    end
end
