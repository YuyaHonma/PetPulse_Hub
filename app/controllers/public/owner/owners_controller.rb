class Public::Owner::OwnersController < ApplicationController
  before_action :check_guest, only: [:show]
  
  def index
    @owner = current_owner
    @posts = @owner.posts
  end
  
  def show
    @owner = current_owner
    @pet = Pet.new
    @pets = @owner.pets.paginate(page: params[:page], per_page: 3)
    @new_registration = true
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
    # 退会手続きの実装が必要
  end
    
  def withdraw
    @owner = current_owner
    @owner.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to owner_owner_root_path
  end
    
  private

  def owner_params
    params.require(:owner).permit(:name, :name_kana, :email, :address, :telephone)
  end
  
  def check_guest
    redirect_to owner_owner_root_path if current_owner.guest?
  end
end
