class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chatroom = Chatroom.find(params[:chatroom_id])
    if @message.save
      redirect_to chatroom_path(@message.chatroom)
    else
      render "chatroom/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
