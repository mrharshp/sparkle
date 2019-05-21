class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = Message.where(chatroom: @chatroom)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @receiver = User.find(params[:receiver_id])
    if Chatroom.where(sender: current_user, receiver: @receiver).length > 0
      @chatroom = Chatroom.where(sender: current_user, receiver: @receiver)[0]
    else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.sender = current_user
    end
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'items/show'
    end
  end

  private

  def chatroom_params
    params.permit(:receiver_id)
  end
end
