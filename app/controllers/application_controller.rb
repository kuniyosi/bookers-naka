class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 上記記述はdeviseの機能（ユーザー登録やログイン認証など）が利用される前にconfigure_permitted_parametersメソッドが実行される

  protected

  # devise_parameter_sanitizer.permitメソッドを使うことでdeviseでnameのデータ保存を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
