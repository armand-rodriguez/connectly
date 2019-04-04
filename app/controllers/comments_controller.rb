class CommentsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @comment = @profile.comments.build(comment_params)
    @comment.update_attributes(user_id: current_user.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
