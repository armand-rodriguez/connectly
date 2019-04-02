class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create

    @user = current_user
    @profile = @user.profile
    @conversation = Conversation.find(params[:conversation_id])

    if @conversation.user_id === @user.id || @conversation.second_user_id === @user.id
      @message = @conversation.messages.build(message_params)
      @message.update_attributes(user_id: @user.id)
      @message.update_attributes(profile_id: @profile.id)
      if @message.save
        # ActionCable.server.broadcast 'conversation_channel', message: @message
        ConversationChannel.broadcast_to @conversation.id, message:      MessagesController.render(partial: 'messages/message', locals: {message: @message, current_user: current_user})
      end
    else
      flash[:notice] = 'That conversation does not exist!'
      redirect_to @profile
    end

  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
