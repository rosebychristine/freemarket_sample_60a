class PurchaseController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
    amount: @product.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  if @product.update(status: 2, user_id: current_user.id)
    flash[:notice] = '購入しました。'
    redirect_to action: 'done' 
  else
    flash[:alert] = '購入に失敗しました。'
    redirect_to controller: "items", action: 'show'
  end
  
  # redirect_to action: 'done' #完了画面に移動
  end

  def done
    @product = Product.find(params[:id])
    @images = @product.images
    # product.status_before_type_cast == 2
  end

  def purchase_conf
    @product = Product.find(params[:id])
    @images = @product.images
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :text,
      :price,
    ).merge(user_id: current_user.id)
  end
end