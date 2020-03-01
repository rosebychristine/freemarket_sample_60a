# # frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
#   before_action :configure_sign_up_params, only: [:create]
#   before_action :configure_account_update_params, only: [:update]

#   def new
#     super
#   end

#   def create
#     super
#   end

#   def member_info

#   end

#   def phone_number
#     current_user.assign_attributes(account_update_params)
#     if current_user.save
#       redirect_to jp_signup_address_path
#     else
#       render "member_info"
#     end
#   end

#   def phone_number_conf

#   end

#   def postal_code
#   end

#   def credit
#   end

    # password = Devise.friendly_token.first(7)
    #     if session[:provider].present? && session[:uid].present?
    #       @user = User.create(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
    #       sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    #     else
    #       @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
    #     end

end