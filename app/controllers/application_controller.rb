class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 上記記述はdeviseの機能（ユーザー登録やログイン認証など）が利用される前にconfigure_permitted_parametersメソッドが実行される

  # ログイン後の遷移先を指定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected

  # devise_parameter_sanitizer.permitメソッドを使うことでdeviseでnameのデータ保存を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
