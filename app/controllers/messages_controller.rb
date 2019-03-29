class MessagesController < ApplicationController

  def index
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @message = @profile.messages.build
    @messages = Message.all
  end

  def create
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @message = Message.new(message_params)
    @message.user = @user
    @message.profile = @profile
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
