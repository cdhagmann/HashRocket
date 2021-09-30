class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new(secure_params)
    if @upvote.save
      redirect_back(fallback_location: posts_path)
    else
      redirect_back(
        fallback_location: posts_path,
        notice: 'Cannot upvote the same post more than once.'
      )
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy
    redirect_back(fallback_location: posts_path)
  end

  private def secure_params
    params.permit(:user_id, :post_id)
  end
end
