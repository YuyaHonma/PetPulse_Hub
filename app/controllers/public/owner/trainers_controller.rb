class Public::Owner::TrainersController < ApplicationController
    before_action :authenticate_owner!, only: [:show] # ログインしていない場合はshowアクションにアクセスできない
    
    def index
        @trainers = Trainer.all
    end
    
    def show
        @trainer = Trainer.find(params[:id])
        @is_room = Room.exists?(owner_id: current_owner.id, trainer_id: @trainer.id)
        @room = Room.find_by(owner_id: current_owner.id, trainer_id: @trainer.id)
    end
end
