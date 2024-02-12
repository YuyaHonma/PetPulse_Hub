class Public::Trainer::TrainersController < ApplicationController
   
   def index
      @trainers = Trainer.page(params[:page]).per(8)
   end
   
   def show
      @trainer = Trainer.find(params[:id])
   end
   
   def edit
      @trainer = current_trainer
   end
   
   def update
    @trainer = current_trainer
    if @trainer.update(trainer_params)
      flash[:success] = "登録情報を変更しました。"
      redirect_to trainer_trainer_path
    else
      render 'edit'
    end
   end
   
   private

   def trainer_params
     params.require(:trainer).permit(:image, :name, :name_kana, :birthday, :hobby, :license, :message, category_ids:[])
   end
end
