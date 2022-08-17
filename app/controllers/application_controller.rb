class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↑こう記述することで、devise利用の機能が使われる前にconfigure_permitted_patametersメソッドが実行される。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使う事で
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータの操作を許可している。
  # ストロングパラメータと同様の機能である。
  # privateは記述したコントローラ内でしか参照できないが、protectedは呼び出された他のコントローラからも参照できる。
end
