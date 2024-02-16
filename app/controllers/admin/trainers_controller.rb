class Admin::TrainersController < ApplicationController
    
    def index
        @trainers = Trainer.page(params[:page]).per(10)
    end
    
    def show
        @trainer = current_trainer
    end
    
    def edit
        @trainer = current_trainer
    end
    
    def update
         @trainer = Trainer.find(params[:id])
      if @trainer.update(trainer_params)
        redirect_to admin_trainer_path(@trainer)
      else
        render :edit
      end
    end
    
    private
  
    def trainer_params
      params.require(:trainer).permit(
      :name,
      :name_kana,
      :telephone,
      :address,
      :email,
      :is_active
     )
    end
end
