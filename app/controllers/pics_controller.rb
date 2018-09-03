class PicsController < ApplicationController
  def show
     @img = Pic.find(params[:id])
  end

  def del
    @img = Pic.find(params[:id])
    @img.destroy
    redirect_to edit_post_path(@img.post)
  end

end