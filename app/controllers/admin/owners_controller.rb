class Admin::OwnersController < ApplicationController
    
  def show
    @owner = Owner.find(params[:id])
  end
  
  def edit
    @owner = Owner.find(params[:id])
  end
  
  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      flash[:notice] = "飼い主の登録情報を変更しました。"
      redirect_to admin_owner_path(@owner)
    else
      render :edit
    end
  end
  
  private
  
  def owner_params
    params.require(:owner).permit(
      :name,
      :name_kana,
      :telephone,
      :address,
      :email,
      :is_active
    )
  end
end
