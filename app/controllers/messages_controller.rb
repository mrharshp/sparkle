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
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    if @message.save
      respond_to do |format|
        format.html { redirect_to chatroom_path(@message.chatroom) }
        format.js # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render "chatroom/show" }
        format.js
      end
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      respond_to do |format|
        format.html { redirect_to chatroom_path(@message.chatroom) }
        format.js # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render "chatroom/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
