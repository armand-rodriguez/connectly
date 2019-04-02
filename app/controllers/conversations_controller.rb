class ConversationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = current_user
    @profile = @user.profile
    @accepted_conversations = Conversation.where(user_id: @user.id)
    @sent_conversations = Conversation.where(second_user_id: @user.id)

  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    @messages = Message.where(conversation_id: @conversation.id)
  end


end
