class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "スケジュールを新規登録しました"
      redirect_to posts_path
    else
      flash.now[:failure] = "スケジュールを作成できませんでした"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:failure] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :start_date,
      :end_date,
      :all_day
    )
  end
end
