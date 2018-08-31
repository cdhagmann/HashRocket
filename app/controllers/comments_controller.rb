class CommentsController < ApplicationController
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
  end  

  def update 
  end

  def destroy 
  end   


private 

def comment_params
  params.require(:comment).permit(:post, :user, :comment)
end

end
