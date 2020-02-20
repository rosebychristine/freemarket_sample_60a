class CommentsController < ApplicationController

  def create
    Comment.create(text: comment_params[:text], product_id: comment_params[:product_id], user_id: current_user.id)
    redirect_to "/items/#{comment.product.id}"
  end

  private
  def comment_params
    params.permit(:text, :product_id)
  end

end
