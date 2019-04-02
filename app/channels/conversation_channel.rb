class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "conversation_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    stop_all_streams
    stream_for data["conversation_id"]
  end
end
