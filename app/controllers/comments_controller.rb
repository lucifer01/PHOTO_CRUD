# frozen_string_literal: true

# This class controls CRUD operation for feature/comment
class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @cmt = Comment.new(permit_comment)
    @cmt.user_id = current_user.id
    if @cmt.save
      flash[:success] = 'Success'
    else
      flash[:error] = @cmt.errors.full_messages
    end
  end

  def destroy
    @cmt = Comment.find(params[:id])
    if @cmt.destroy
      flash[:success] = 'Success'
    else
      flash[:error] = @cmt.errors.full_messages
    end   
  end

  def edit
    @cmt = Comment.find(params[:id])
  end

  def update
    @cmt = Comment.find(params[:id])
    if @cmt.update(permit_comment)
      flash[:success] = 'Success'
    else
      flash[:error] = @cmt.errors.full_messages
    end
  end

  private

  def permit_comment
    params.require(:comment).permit(:description, :post_id)
  end
end
