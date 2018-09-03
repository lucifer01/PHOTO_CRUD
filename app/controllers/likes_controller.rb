# frozen_string_literal: true

# This class controls operation for feature/like-dislike
class LikesController < ApplicationController
  respond_to :html, :js

  def up
    if current_user.already_likes?(params[:post_id])
      @like = current_user.likes.find(params[:like_id])
      if @like.update(vote: true)
        flash[:success] = 'Success'
      else
        flash[:error] = @like.errors.full_messages
      end
    else          
      @like = Like.new(user_id: current_user.id, post_id: params[:post_id], vote: true)
      if @like.save
        flash[:success] = 'Success'
      else
        flash[:error] = @like.errors.full_messages
      end
    end
  end

  def down
    if current_user.already_likes?(params[:post_id])
      @dislike = current_user.likes.find(params[:like_id])
      if @dislike.update(vote: false)
        flash[:success] = 'Success'
      else
        flash[:error] = @dislike.errors.full_messages
      end
    else          
      @dislike = Like.new(user_id: current_user.id, post_id: params[:post_id], vote: false)
      if @dislike.save
        flash[:success] = 'Success'
      else
        flash[:error] = @dislike.errors.full_messages

      end
    end
  end

end