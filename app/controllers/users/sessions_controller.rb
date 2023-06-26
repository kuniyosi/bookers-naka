class Users::SessionsController < Devise::SessionsController
  
  # ゲストログイン機能の実装
  def guest_sign_in
    user = User.guest
    # sign_inメソッドでUser.guestをログイン状態に
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end
end