class ItemsController < ApplicationController

    def index
      @products = Product.order("created_at DESC")
      
    end

    def create
    end

    def edit
    end

    def update
    end

    def show
      @Product = Product.find(params[:id])
    end 

    def new
    end
end
