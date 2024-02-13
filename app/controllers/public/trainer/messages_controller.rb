class Public::Trainer::MessagesController < ApplicationController
  before_action :authenticate_trainer! # トレーナーがログインしていることを確認する
  before_action :set_room

  def create
    @message = @room.messages.new(message_params)
    @message.trainer = current_trainer # 現在のトレーナーをメッセージの所有者としてセットします
    if @message.save
      redirect_to @room, notice: 'メッセージが送信されました'
    else
      render :show
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id]) # パラメータからルームを検索してセットします
  end

  def message_params
    params.require(:message).permit(:content)
  end
end