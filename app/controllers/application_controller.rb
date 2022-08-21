class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  # before_actionメソッドは、このコントローラーが動作する前に実行される。
  # 今回の場合、app/controller/application_controller.rbに記述したので、全てのコントローラーで、最初にbefore_actionメソッドが実行される。
  # authenticate_userメソッドはdevise側が用意しているメソッド。:authenticate_user!とすることでログイン認証されていなければログイン画面へリダイレクトするという機能を実装できる。
  # exceptは指定したアクションをbefore_actionの対象から外す。ログイン状態に関わらずアクセス可能とするためにtopアクションを指定。
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↑こう記述することで、devise利用の機能が使われる前にconfigure_permitted_patametersメソッドが実行される。

  # ↓ after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド。
  # after_sign_in_path_forは、初期設定ではroot_pathになっている。
  def after_sign_in_path_for(resource)
    about_path
  end
  # ↓ after_sign_out_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド。
  # after_sign_out_path_forは、初期設定ではroot_pathになっている。
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使う事で
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータの操作を許可している。
  # ストロングパラメータと同様の機能である。
  # privateは記述したコントローラ内でしか参照できないが、protectedは呼び出された他のコントローラからも参照できる。
end
