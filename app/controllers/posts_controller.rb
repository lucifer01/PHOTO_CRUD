class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    if user_signed_in?
    @post = current_user.posts
    else 
      @post = Post.all
    end

  end
  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  def edit
      @post = Post.find(params[:id])
      #@post.update()
      #binding.pry
  end

  def update 
    @post = Post.find(params[:id]).update(permit_post)
    redirect_to posts_path

  end


  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    @post.user_id = current_user.id
    # binding.pry
    if @post.save
        #individual post page
        flash[:success] = "Success"
        redirect_to post_path(@post)
    else
        flash[:error] = @post.errors.full_messages
        redirect_to new_post_path
    end  
  end

#TO prevent sql injection, ensures user can only edit image and descriptions only.  
  private 
    def permit_post
       params.require(:post).permit(:image, :description) 
    end
end
