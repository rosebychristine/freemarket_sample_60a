# # frozen_string_literal: true

# class Users::RegistrationsController < Devise::RegistrationsController
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

# end