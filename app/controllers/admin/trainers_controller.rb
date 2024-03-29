class Admin::TrainersController < ApplicationController
    
  def index
    @trainers = Trainer.page(params[:page]).per(10)
  end
  
  def show
    @trainer = Trainer.find(params[:id])
  end
  
  def edit
    @trainer = Trainer.find(params[:id])
  end
  
  def update
    @trainer = Trainer.find(params[:id])
    if @trainer.update(trainer_params)
      flash[:notice] = "トレーナーの登録情報を変更しました。"
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
