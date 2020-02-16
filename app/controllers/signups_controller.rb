class SignupsController < ApplicationController
    def member_info
    end
   
    def phone_number_info
    end


    def credit
    end

    def phone_number_conf
    end

    def postal_code
      @address = Adress.new
    end

    def create
      Adress.new(address_params)
      # binding.pry
    end

    def ready
    end


    private
    def address_params
      params.permit(:postal_code, :country, :prefectures, :city, :address, :name, :last_name, :tell)
    end
end
