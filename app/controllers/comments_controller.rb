class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @idea = Idea.find(params[:idea_id])
    @comment.idea = @idea
    @comment.user = current_user
    if @comment.save
      redirect_to user_idea_path(current_user,@idea), notice: "Thanks for the comment!"
    else
      flash[:alert] = "Something went wrong"
      render "/ideas/show"
    end
  end

  def edit

  end

  def destroy

  end



end
