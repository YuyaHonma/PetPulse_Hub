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
    
  end

end
