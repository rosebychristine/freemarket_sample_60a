class ItemsController < ApplicationController

    def index
        @items = Item.includes(:images).order('created_at DESC')
    end

    def create
    end

    def edit
    end

    def update
    end

    def show
    end

    def new
        @product = Product.new
    end
end
