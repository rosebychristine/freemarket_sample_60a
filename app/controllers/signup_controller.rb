class SignupController < ApplicationController
    def step1
        @user = User.new
    end
    
    def step2
      # step1で入力された値をsessionに保存
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:name_last] = user_params[:name_last]
      session[:name_middle] = user_params[:name_middle]
      session[:name_middle_kana] = user_params[:name_middle_kana]
      session[:name_last_kana] = user_params[:name_last_kana]
      session[:birthdate_year] = user_params[:birthdate_year]
      session[:birthdate_month] = user_params[:birthdate_month]
      session[:birthdate_day] = user_params[:birthdate_day]
      @user = User.new # 新規インスタンス作成
      end 

      def step3
      session[:phone_number] = user_params[:phone_number]
      @user = User.new
      end

      def step4
        session[:phone_number_conf] = user_params[:phone_number_conf]
        @address = Address.new
      end

      def step5
        session[:last_name] = address_params[:last_name]
        session[:first_name] = address_params[:first_name]
        session[:last_name_kana] = address_params[:last_nama_kana]
        session[:first_name_kana] = address_params[:first_name_kana]
        session[:postal_code] = address_params[:postal_code]
        session[:prefectures] = address_params[:prefectures]
        session[:buildingname] = address_params[:buildingname]
        session[:tell] = address_params[:tell]
        @user = User.new
      end

      def create2
        session[:credit_card_no] = user_params[:credit_card_no]
        session[:creditmonth_id] = user_params[:creditmonth_id]
        session[:credityear_id] = user_params[:credityear_id]
        session[:credit_card_security_code] = user_params[:credit_card_security_code]
        @user = User.new(
          nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
          email: session[:email],
          password: session[:password],
          name_last: session[:name_last], 
          name_middle: session[:name_middle], 
          name_last_kana: session[:name_last_kana], 
          name_middle_kana: session[:name_middle_kana], 
          birthdate_year: session[:birthdate_year], 
          birthdate_month: session[:birthdate_month],
          birthdate_day: session[:birthdate_day],
          phone_number: session[:phone_number],
          phone_number_conf: session[:phone_number_conf],
          credit_card_no: session[:credit_card_no],
          creditmonth_id: session[:creditmonth_id],
          credityear_id: session[:credityear_id],
          credit_card_security_code: session[:credit_card_security_code]
        )
        @address = Address.new(
          last_name: session[:last_name],
          first_name: session[:first_name],
          last_name_kana: session[:last_name_kana],
          first_name_kana: session[:first_name_kana],
          postal_code: session[:postal_code],
          prefectures: session[:prefectures],
          tell: session[:tell]
        )
        # user.rb
        #   accept_nested_attributes_for :addresses

        if
          @user.save
          session[:id] = @user.id
        else
          render '/signup/step2'
        end
      end
      private

        def user_params
          params.require(:user).permit(:nickname, :email, :password,:name_last, :name_middle, :name_last_kana, :name_middle_kana, :phone_number, :phone_number_conf,:birthdate_year, :birthdate_month, :birthdate_day, :credit_card_no, :creditmonth_id, :credityear_id, :credit_card_security_code)
        end

        def address_params
          params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefectures, :buildingname, :tell)
        end

        def done
          sign_in User.find(session[:id]) unless user_signed_in?
        end
    end