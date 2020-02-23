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
    fee_budd 
    sipping_time
    prefectures 

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
    def fee_budd 
        @fee_budd = ["送料込み(出品者負担)", "着払い(購入者負担)"]
      end
  
      def sipping_time
        @sipping_time = ["1~2日で発送", "2~3日で発送", "4~7日で発送"]
      end
  
      def prefectures
        @prefectures = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
              "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
              "新潟県","富山県","石川県","福井県","山梨県","長野県",
              "岐阜県","静岡県","愛知県","三重県",
              "滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県",
              "鳥取県","島根県","岡山県","広島県","山口県",
              "徳島県","香川県","愛媛県","高知県",
              "福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県", 
              "沖縄県"]
      end
  
end
