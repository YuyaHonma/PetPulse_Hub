class Public::Owner::MessagesController < ApplicationController
  before_action :authenticate_owner! # 飼い主がログインしていることを確認する

  def create
    @message = @room.messages.new(message_params)
    @message.owner = current_owner # 現在の飼い主をメッセージの所有者としてセットします
    if @message.save
      redirect_to @room, notice: 'メッセージが送信されました'
    else
      render :show
    end
  end
  
  def show
      @room = Room.find(params[:room_id]) # パラメータからルームを検索してセットします
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
