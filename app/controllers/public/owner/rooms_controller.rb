class Public::Owner::RoomsController < ApplicationController
  before_action :authenticate_owner! # 飼い主がログインしていることを確認する

  def create
    trainer_id = params[:trainer_id]
    @room = Room.create(owner_id: current_owner.id, trainer_id: trainer_id)
    if @room.persisted?
      redirect_to owner_room_path(@room), notice: 'チャットルームが作成されました'
    else
      redirect_back fallback_location: owner_trainer_path, alert: 'チャットルームの作成に失敗しました'
    end
  end
  
  def show
    @room = Room.find(params[:id])
    
    @trainer = @room.trainer # ルームに関連付けられたトレーナーを取得します
    @messages = @room.messages.order(created_at: :asc) # ルームに関連付けられた全てのメッセージを時系列順に取得します
    @message = Message.new
    
    # メッセージをトレーナーのメッセージと飼い主のメッセージに分けます
    @owner_messages = @messages.where(owner_id: current_owner.id)
    @trainer_messages = @messages.where.not(owner_id: current_owner.id)
  end

  
  private

  def message_params
    params.require(:message).permit(:message)
  end

end
