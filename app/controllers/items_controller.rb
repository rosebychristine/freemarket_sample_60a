class ItemsController < ApplicationController

    def index
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

    end

    def edit
    end

    def update
    end

    def show
      @Product = Product.find(params[:id])
    end 
    def product_params
        params.require(:product).permit(:name, :price ,:description).merge(user_id: 1)
    end
end
