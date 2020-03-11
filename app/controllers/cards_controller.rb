class CardController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end



# class CardsController < ApplicationController
#   require "payjp"

#   def new
#     card = Card.where(user_id: current_user.id)
#     redirect_to action: "show" if card.exists?
#   end

# #   def pay #クレジットカード登録
# #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
# #     # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
# #     if params['payjp-token'].blank?
# #     # paramsの中にjsで作った'payjpTokenが存在するか確かめる
# #       redirect_to action: "new"
# #     else
# #       customer = Payjp::Customer.create(
# #       card: params['payjp-token'],
# #       metadata: {user_id: current_user.id}
# #       )
# #      # ↑ここでjay.jpに保存
# #       @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
# #      # ここでdbに保存
# #       if @card.save
# #         redirect_to action: "show"
# #         flash[:notice] = 'クレジットカードの登録が完了しました'
# #       else
# #         redirect_to action: "pay"
# #         flash[:alert] = 'クレジットカード登録に失敗しました'
# #       end
# #     end
# #  end

#   def pay #payjpとCardのデータベース作成を実施します。
#     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
#     if params['payjp-token'].blank?
#       redirect_to action: "new"
#     else
#       customer = Payjp::Customer.create(
#       description: '登録テスト', #なくてもOK
#       email: current_user.email, #なくてもOK
#       card: params['payjp-token'],
#       metadata: {user_id: current_user.id}
#       ) #念の為metadataにuser_idを入れましたがなくてもOK
#       @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
#       if @card.save
#         redirect_to action: "show"
#       else
#         redirect_to action: "pay"
#       end
#     end
#   end

#   def delete #PayjpとCardデータベースを削除します
#     card = Card.where(user_id: current_user.id).first
#     if card.blank?
#     else
#       Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       customer.delete
#       card.delete
#     end
#       redirect_to action: "new"
#   end

#   def show
#     card = current_user.credit_card
#     if card.blank?
#       redirect_to action: "new" 
#     else
#       Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       @customer_card = customer.cards.retrieve(card.card_id)
#     end
#   end

#   # def buy #クレジット購入

#   #   if card.blank?
#   #     redirect_to action: "new"
#   #     flash[:alert] = '購入にはクレジットカード登録が必要です'
#   #   else
#   #     @product = Product.find(params[:product_id])
#   #    # 購入した際の情報を元に引っ張ってくる
#   #     card = current_user.credit_card
#   #    # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
#   #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
#   #    # キーをセットする(環境変数においても良い)
#   #     Payjp::Charge.create(
#   #     amount: @product.price, #支払金額
#   #     customer: card.customer_id, #顧客ID
#   #     currency: 'jpy', #日本円
#   #     )
#   #    # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
#   #     if @product.update(status: 1, buyer_id: current_user.id)
#   #       flash[:notice] = '購入しました。'
#   #       redirect_to controller: "products", action: 'done'
#   #     else
#   #       flash[:alert] = '購入に失敗しました。'
#   #       redirect_to controller: "products", action: 'show'
#   #     end
#   #   end
#   # end
# end
#   # redirect_to action: 'done' #完了画面に移動
#   # # render 'done'
#   # end

#   # def done
#   # end

# #   def show #Cardのデータpayjpに送り情報を取り出します
# #     card = Card.where(user_id: current_user.id).first
# #     if card.blank?
# #       redirect_to action: "new" 
# #     else
# #       Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
# #       customer = Payjp::Customer.retrieve(card.customer_id)
# #       @default_card_information = customer.cards.retrieve(card.card_id)
# #     end
# #   end