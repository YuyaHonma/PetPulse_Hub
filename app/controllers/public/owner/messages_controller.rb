class Public::Owner::MessagesController < ApplicationController
  before_action :authenticate_owner! # 飼い主がログインしていることを確認する

  def create
    @room = Room.find(params[:room_id]) # パラメータからルームを検索してセットします
    @message = @room.messages.new(message_params)
    @message.owner = current_owner # 現在の飼い主をメッセージの所有者としてセットします
    @message.send_type = true
    @message.trainer = @room.trainer
    if @message.save!
      redirect_to owner_room_path(@room), notice: 'メッセージが送信されました'
    else
      redirect_to owner_room_path(@room), alert: 'メッセージの送信に失敗しました'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
