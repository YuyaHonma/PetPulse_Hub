class Public::Trainer::TrainersController < ApplicationController
   
   before_action :check_trainer, only: [:index, :show]
   
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
   
   def unsubscribe
   end

   def withdraw
     @trainer = current_trainer
     if @trainer.update(is_active: false) # ここで特定のカラムを更新せずに退会処理を実行
       reset_session
       flash[:notice] = "退会処理を実行しました"
       redirect_to new_trainer_session_path
     else
       flash[:alert] = "退会処理に失敗しました"
       redirect_to trainer_trainer_path(@trainer)
     end
   end
   
   private

   def trainer_params
     params.require(:trainer).permit(:image, :name, :name_kana, :birthday, :hobby, :license, :message, category_ids:[])
   end
   
   def check_trainer
      unless trainer_signed_in?
        flash[:alert] = "ログインが必要です"
        redirect_to trainer_trainer_root_path
      else current_trainer.guest?
        flash[:alert] = "ログインが必要です"
        redirect_to trainer_trainer_root_path
      end
    end

end
