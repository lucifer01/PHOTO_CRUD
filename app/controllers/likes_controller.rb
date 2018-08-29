class LikesController < ApplicationController
  def up
    if current_user.already_likes?(params[:post_id])
      @like = current_user.likes.find(params[:like_id])
      if @like.update(vote: true)
        redirect_to posts_path
      end
    else          
      @like = Like.new
      @like.user_id = current_user.id
      @like.post_id = params[:post_id]
      @like.vote = true
      if @like.save
        redirect_to posts_path
      end
    end

  end

   def down
    if current_user.already_likes?(params[:post_id])
      like = current_user.likes.find(params[:like_id])
      if like.update(vote: false)
        redirect_to posts_path
      end
    else          
      like = Like.new
      like.user_id = current_user.id
      like.post_id = params[:post_id]
      like.vote = false
      if like.save
        redirect_to posts_path
      end
    end
  end

  def show_likes
  end

   def show_dislikes
   end


end
