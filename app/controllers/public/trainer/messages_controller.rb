class Public::Trainer::MessagesController < ApplicationController
  before_action :authenticate_trainer! # トレーナーがログインしていることを確認する

  def create
    @room = Room.find(params[:room_id]) # パラメータからルームを検索してセットします
    @message = @room.messages.new(message_params)
    @message.trainer = current_trainer # 現在のトレーナーをメッセージの所有者としてセットします
    @message.owner = @room.owner
    if @message.save!
      redirect_to trainer_room_path(@room), notice: 'メッセージが送信されました'
    else
      redirect_to trainer_room_path(@room), alert: 'メッセージの送信に失敗しました'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end