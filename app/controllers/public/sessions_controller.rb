# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name])
   end
# サインイン後投稿一覧ページへ
  def after_sign_in_path_for(resource)
    public_posts_path
  end
# サインアウト後ログイン画面へ
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
