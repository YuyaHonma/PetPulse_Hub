# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource
      sign_in(resource_name, resource)
      flash[:notice] = "ログインが成功しました！"
      redirect_to admin_root_path
    # else
    #   flash[:notice] = "投稿失敗!!"
    #   render 'new'
      # flash[:alert] = "メールアドレスまたはパスワードが間違っています。"
      # redirect_to new_admin_session_path
    end
  end
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  # def after_sign_in_path_for(resource)
  #   flash[:notice] = "ログインが成功しました！！"
  #   admin_root_path
  # end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトが成功しました"
    new_admin_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
