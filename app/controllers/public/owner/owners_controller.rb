class Public::Owner::OwnersController < ApplicationController
  
  def show
    @owner = current_owner
    @pet = current_owner.pets if current_owner.present?
    @new_registration = true # 新規登録フォームを表示する
  end
    
  def edit
    @owner = current_owner
  end
    
  def update
    @owner = current_owner
    if @owner.update(owner_params)
      flash[:success] = "登録情報を変更しました。"
      redirect_to owner_my_page_path
    else
      render 'edit'
    end
  end
    
  def unsubscribe
  end
    
  def withdraw
    @owner = current_owner
    @owner.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to owner_root_path
  end
    
  private

  def owner_params
    params.require(:owner).permit(:name, :name_kana, :email, :address, :telephone)
  end
end
