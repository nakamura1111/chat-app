class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new()
    @messages = @room.messages.includes(:user)        # 「今のチャットルーム」の「メッセージたち」を定義する。このとき、userの情報を何度も呼び出したくないからincludeで一回だけ呼び出すよ
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save()
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index                                   # render だから index に引き継がれても大丈夫なインスタンス変数を用意
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
