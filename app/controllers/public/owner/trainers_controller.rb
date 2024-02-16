class Public::Owner::TrainersController < ApplicationController
    def index
        @trainers = Trainer.all
    end
    
    def show
        @trainer = Trainer.find(params[:id])
        @is_room = Room.exists?(owner_id: current_owner.id, trainer_id: @trainer.id)
        @room = Room.find_by(owner_id: current_owner.id, trainer_id: @trainer.id)
    end
end
