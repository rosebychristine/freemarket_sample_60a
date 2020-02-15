class SellsController < ApplicationController
    def buy_conf
    end

    def new
       Product.create(sell_params)
    end

    def sell_params
        params.permit(:name, :price).merge(user_id: current_user.id)
    end
end
