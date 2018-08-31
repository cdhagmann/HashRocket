class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new(secure_params)
    @upvote.post = Post.find(params[:post_id])
    if @upvote.save
      redirect_to posts_url
    else  
      redirect_to posts_url, notice: 'Cannot upvote the same post more than once.' 
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy
    redirect_to posts_url
  end

  private
    def secure_params
      params.permit(:user_id, :post_id)
    end
end