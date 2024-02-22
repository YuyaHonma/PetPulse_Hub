class Public::Trainer::TrainersController < ApplicationController
   
   def index
      @trainers = Trainer.page(params[:page]).per(8)
   end
   
   def show
      @trainer = current_trainer
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
   
   def check_guest
     if current_trainer.guest?
       redirect_to trainer_trainer_root_path
     end
   end
end
