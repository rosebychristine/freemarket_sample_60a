class ItemsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Product.includes(:images).order('created_at DESC').limit(5)
      
    end

    def new
      # 出品画面を表示するためのアクション
      # form_withを使うためにまずインスタンス生成をする（空っぽのインスタンスの準備）
      unless user_signed_in?
          redirect_to root_path
      end
      @product = Product.new
      @product.images.new
      # @product.build_shipping
      product_condition
      fee_burden 
      sipping_time
      prefectures 

    end

    def create
    # 保存する処理
        @product = Product.new(product_params) 
            if @product.save && @product.valid?
                redirect_to root_path
            else
                render :new
            end
    end

    def edit
    product_condition
    fee_burden 
    sipping_time
    prefectures 
    
    
    end

    def update
        if @product.update(product_params)
          redirect_to root_path
        else 
          redirect_to edit_item_path
        end
      end

    def show
        @images = @product.images
    end

    def destroy
        if @product.user_id == current_user.id
           @product.destroy
           redirect_to root_path, notice: '商品を削除しました'
        end
    end

    def purchase
      Payjp.api_key = PAYJP_SECRET_KEY
      Payjp::Charge.create(currency: 'jpy', amount: 1000, card: params['payjp-token'])
      redirect_to root_path, notice: "支払いが完了しました"
    end

    private
    def product_params
        params.require(:product).permit(:image,:id,:name, :price ,:description, :condition, :fee_burden, :shipping_time,:prefectures, images_attributes: [:src ,:id]).merge(user_id: current_user.id)
    end
    
    def find_product
        @product = Product.find(params[:id])
        @image = Image.find_by(id: params[:id])
    end

    def product_condition
        @condition = ["新品、未使用","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
    end
    def fee_burden
        @fee_burden = ["送料込み(出品者負担)", "着払い(購入者負担)"]
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
