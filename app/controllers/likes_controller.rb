class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    like = idea.likes.new
    like.user = current_user
    if like.save
      redirect_to root_path, notice: "You liked this idea"
    else
      redirect_to root_path, alert: "Error"
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    like = idea.likes.find_by_user_id current_user
    like.destroy
    redirect_to root_path, notice: "Unliked"
  end

end
