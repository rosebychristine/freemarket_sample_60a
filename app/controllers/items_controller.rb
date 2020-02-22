class ItemsController < ApplicationController

    def index
    #   @items = Item.includes(:images).order('created_at DESC')
      @products = Product.order("created_at DESC").limit(5)

    end

    def new
    # 出品画面を表示するためのアクション
    # form_withを使うためにまずインスタンス生成をする（空っぽのインスタンスの準備）
    @product = Product.new
    end

    def create
    # 保存する処理
        @product = Product.create(product_params)
        @product = Item.includes(:images).order('created_at DESC').limit(10)

    end

    def edit
    end

    def update
    end

    def show
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name, :price ,:description, images_attributes: {image: []}).merge(user_id: 1)
    end
end
