class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.friendly.find(params[:post_id])
    @post.comments << Comment.new(comment_params)
    redirect_to @post
  end
  
  protected
  
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end