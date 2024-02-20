class Public::Trainer::SessionsController < Devise::SessionsController
  before_action :trainer_state, only: [:create]
  
  # ゲストログインの実装
  def guest_login
    trainer = Trainer.guest
    sign_in trainer
    redirect_to trainer_trainer_root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  protected
  
  def trainer_state
    trainer = Trainer.find_by(email: params[:trainer][:email])
    return if trainer.nil?
    return unless trainer.valid_password?(params[:trainer][:password])
    if trainer.is_active
      sign_in(trainer)
      redirect_to trainer_trainer_root_path
    else
      flash[:notice] = "既に退会済みのアカウントです。新規会員登録が必要になります。"
      redirect_to new_trainer_registration_path
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  def after_sign_in_path_for(resource)
    trainer_trainer_path(current_trainer)
  end

  def after_sign_out_path_for(resource)
    new_trainer_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
