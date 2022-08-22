class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @post_images=@user.post_images.page(params[:page])
    # ↑ アソシエーションを持っているモデル同士の記述方法。
    # ↑ このように記述する事で、特定のユーザー(@user)に関連付けられた投稿全て(.post_images)を取得し、@post_imagesに渡すという処理を行うことができる。
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
