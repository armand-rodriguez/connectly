class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_profile = current_user.profile
    @comment = Comment.find(params[:comment_id])
    @profile = @comment.profile
    if @profile.requests.where(user_id: current_user.id, request_status_id: 2).count === 1 || FriendConnection.where(user_id: current_user.id, second_user_id: @profile.user.id).count === 1 || @profile.user_id === current_user.id
      current_like = Like.find_by(comment_id: @comment.id, user_id: current_user.id)
      if current_like && current_like.liked === true
        current_like.update_attributes(liked: false)
      elsif current_like && current_like.liked === false
        current_like.update_attributes(liked: true)
      else
        @like = @comment.likes.build
        @like.update_attributes(user_id: current_user.id)
        @like.save
      end
    else
      flash[:alert] = 'You cannot like this post'
      redirect_to @user_profile and return
    end



  end
end
