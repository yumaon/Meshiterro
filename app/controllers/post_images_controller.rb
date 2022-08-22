class PostImagesController < ApplicationController
  def new
    @post_image=PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image=PostImage.new(post_image_params)

    # ↓current_userはコードに記載するだけで、ログイン中のユーザーの情報を取得できる。
    # ヘルパーメソッドと呼ばれるものの一種。deviseをインストールすることで使用可。
    @post_image.user_id = current_user.id
    if  @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def destroy
    @post_image=PostImage.find(params[:id])
    @post_image.destroy
    redirect_to '/post_images'
  end

  def index
    # @post_images=PostImage.all → ページネーション機能の実装で下記に記述を変更。
    @post_images=PostImage.page(params[:page])
    # ↑ pageメソッドは、kaminariをインストールしたことで使用可能になったメソッド。
  end

  def show
    @post_image=PostImage.find(params[:id])
    @post_comment=PostComment.new
    # ↑ コメントを投稿するためのインスタンス変数を定義する。
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
