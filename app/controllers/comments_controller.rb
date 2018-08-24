class CommentsController < ApplicationController
  def index
    @cmt = Comment.new
  end

  def create
    @cmt = Comment.new(permit_comment)
    @cmt.post_id = params[:comment][:post_id]
      if @cmt.save
        flash[:success] = "Success"
        redirect_to root_path(@cmt)
      end  
     
  end

  def destroy
    @cmt = Comment.find(params[:id])
    @cmt.destroy
    redirect_to posts_path
  end

  def edit
    @cmt = Comment.find(params[:id])
  end

  def update
    @cmt = Comment.find(params[:id])
    if @cmt.update(permit_comment)
      flash[:success] = "Success"
      redirect_to posts_path(@cmt)
    else
        flash[:error] = @cmt.errors.full_messages
        redirect_to edit_comment_path
    end
  end



private 
    def permit_comment
       params.require(:comment).permit(:description) 
    end

end