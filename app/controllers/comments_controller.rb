class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  

  def new 
    redirect_to post_path, notice: 'You must be logged in to comment' if !(current_user)
    @comment = Comment.new 
  end 
  
  def create 
    @comment = Comment.new(comment_params) 

    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      render :new 
    end
  end

  def edit 
    redirect_to posts_path, notice: 'You must be the author of this comment to edit it'  if !(current_user.id == @post.user_id) 
  end  

  def update 

    if @comment.update(comment_params)
      redirect_to post_path, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy 
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path, notice: 'comment was successfully destroyed.' }
    end
  end   


private 

def set_comment
  @comment = Comment.find(params[:id])
end

def comment_params
  params.permit(:post_id, :user_id, :comment)
end

end
