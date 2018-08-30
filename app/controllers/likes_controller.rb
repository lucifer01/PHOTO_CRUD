class LikesController < ApplicationController
  def up
    if current_user.already_likes?(params[:post_id])
      like = current_user.likes.find(params[:like_id])
      if like.update(vote: true)
        redirect_to posts_path
      else
        flash[:error] = like.errors.full_messages
        redirect_to posts_path
      end
    else          
      like = Like.new(user_id: current_user.id, post_id: params[:post_id], vote: true)
      if like.save
        redirect_to posts_path
      else
        flash[:error] = like.errors.full_messages
        redirect_to posts_path
      end
    end

  end

  def down
    if current_user.already_likes?(params[:post_id])
      like = current_user.likes.find(params[:like_id])
      if like.update(vote: false)
        redirect_to posts_path
      else
        flash[:error] = like.errors.full_messages
        redirect_to posts_path
      end
    else          
      like = Like.new(user_id: current_user.id, post_id: params[:post_id], vote: false)
      if like.save
        redirect_to posts_path
      else
        flash[:error] = like.errors.full_messages
        redirect_to posts_path
      end
    end
  end

  def show_likes
    @likes = Post.find(params[:id]).likes.where(vote: true) 
  end

  def show_dislikes
    @dislikes = Post.find(params[:id]).likes.where(vote: false)
  end


end
