class Public::Trainer::OwnersController < ApplicationController
  before_action :authenticate_trainer!, only: [:show]
    
  def index
    @owners = Owner.all
  end
    
  def show
    @owner = Owner.find(params[:id])
    @pets = @owner.pets.all  # @ownerに関連付けられたペットを取得し、@petsに代入する
    @is_room = Room.exists?(trainer_id: current_trainer.id, owner_id: @owner.id)
    @room = Room.find_by(trainer_id: current_trainer.id, owner_id: @owner.id)
  end
end
