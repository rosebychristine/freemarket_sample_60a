class PurchaseController < ApplicationController
  require 'payjp'

  def index
    @product = Product.find(params[:id])
    @images = @product.images
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  # def pay
  #   @product = Product.find(params[:id])

  #   card = Card.where(user_id: current_user.id).first
  #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #   Payjp::Charge.create(
  #   :amount => @product.price, #支払金額を入力（itemテーブル等に紐づけても良い）
  #   :customer => @card.user_id, #顧客ID
  #   :currency => 'jpy', #日本円
  # )
  # redirect_to action: 'done' #完了画面に移動
  # # render 'done'
  # end
  def buy #クレジット購入

    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:product_id])
     # 購入した際の情報を元に引っ張ってくる
      card = current_user.credit_card
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
     # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if @product.update(status: 1, buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "products", action: 'done'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "products", action: 'show'
      end
    end
  end

  def done
  end

end
