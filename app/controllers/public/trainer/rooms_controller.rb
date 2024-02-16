class Public::Trainer::RoomsController < ApplicationController
  before_action :authenticate_trainer! # トレーナーがログインしていることを確認する
  
  def index
    @rooms = current_trainer.rooms.includes(:owner).order(created_at: :desc) # ログイン中のトレーナーに関連する全てのルームを取得し、最新のものから並べ替える
  end

  def show
    @room = Room.find(params[:id])
    @owner = @room.owner # ルームに関連付けられた飼い主を取得します
    @trainer_messages = @room.messages.where(trainer_id: current_trainer.id) # トレーナーのメッセージを取得します
    @owner_messages = @room.messages.where.not(trainer_id: current_trainer.id) # 飼い主のメッセージを取得します
    @message = Message.new # 新しいメッセージ用のインスタンスを作成します
    @messages = @room.messages # ルームに関連するすべてのメッセージを取得します
  end

  def create
    owner_id = params[:owner_id]
    @room = Room.create(trainer_id: current_trainer.id, owner_id: owner_id)
    if @room.persisted?
      redirect_to trainer_room_path(@room), notice: 'チャットルームが作成されました'
    else
      redirect_back fallback_location: trainer_owner_path, alert: 'チャットルームの作成に失敗しました'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end