class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new 
    @comment = Comment.new 
  end 

  def create 
    @comment = Comment.new(comment_params) 

    if @comment.save
      redirect_to post_path, notice: 'Comment was successfully created.'
    else
      render :new 
    end
  end

  def edit 
    @comment = Comment.find(params[:id])
  end  

  def update 
    @comment = Comment.find(params[:id])

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
  params.require(:comment).permit(:post, :user, :comment)
end

end
