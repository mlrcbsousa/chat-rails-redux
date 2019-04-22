class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    render json: Message.to_react(@channel)
  end

  def create
    message = @channel.messages.new message_params
    message.update! user: current_user
    render json: message.to_react
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_channel
    @channel = Channel.find_by_name params[:channel_id]
  end
end
