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
    Post.find(params[:id]).pic.each do |x|
      x.destroy
    end
    Post.find(params[:id]).destroy   
    redirect_to posts_path
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update 
      @post = Post.find(params[:id])
      if @post.update(permit_post)
          params[:post][:image].each do |x|
            img = Pic.new(permit_image)
            img.post_id = @post.id
            img.image = x 
            img.save
        end  
        flash[:success] = "Success"
        redirect_to post_path(@post)
      else
        flash[:error] = @post.errors.full_messages
        redirect_to new_post_path
      end
  end 

  def show
      @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    @post.user_id = current_user.id
      if @post.save
        params[:post][:image].each do |x|
          img = Pic.new(permit_image)
          img.post_id = @post.id
          img.image = x 
          img.save
        end  
        flash[:success] = "Success"
        redirect_to post_path(@post)
      else
        flash[:error] = @post.errors.full_messages
        redirect_to new_post_path
      end  
  end

#TO prevent sql injection, ensures user can only edit image(s) and descriptions only.  
  private 
    def permit_post
       params.require(:post).permit(:description) 
    end

    def permit_image
       params.require(:post).permit(:image) 
    end
 

end
