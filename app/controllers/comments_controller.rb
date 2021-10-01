# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def new
    redirect_to post_path, notice: 'You must be logged in to comment' unless current_user
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully launched.'
    else
      render :new
    end
  end

  def edit
    redirect_to posts_path
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post, notice: 'Comment was successfully destructed.'
  end

  private def set_comment
    @comment = Comment.find(params[:id])
  end

  private def comment_params
    params.permit(:post_id, :user_id, :comment)
  end
end
