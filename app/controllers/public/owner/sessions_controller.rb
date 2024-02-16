class Public::Owner::SessionsController < Devise::SessionsController
  before_action :owner_state, only: [:create]

  # ゲストログインの実装
  def guest_login
    owner = Owner.guest
    sign_in owner
    redirect_to owner_owner_root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def owner_state
    owner = Owner.find_by(email: params[:owner][:email])
    return if owner.nil?
    return unless owner.valid_password?(params[:owner][:password])
    if owner.is_active
      sign_in(owner)
      redirect_to owner_owner_root_path
    else
      flash[:notice] = "既に退会済みのアカウントです。新規会員登録が必要になります。"
      redirect_to new_owner_registration_path
    end
  end
  
  def after_sign_in_path_for(resource)
    owner_my_page_path
  end

  def after_sign_out_path_for(resource)
    new_owner_session_path
  end
  
end